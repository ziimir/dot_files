local M      = {}

-- ===== state / defaults =====
local ns     = vim.api.nvim_create_namespace("mdoutline")
local states = {} -- per-source-buf → {win, buf, items}

local opts   = {
    max_level = nil,
    icons = {
        heading = { "󰓹", "󰓹", "󰓹", "󰓹", "󰓹", "󰓹" },
        link    = "󰌹",
        embed   = "󰈔",
    },
    filetypes = { "markdown" },
    wikilinks = true,

    -- попап всегда по центру и большой
    float = {
        width    = 0.75, -- доля от ширины экрана (0..1) или число колонок
        height   = 0.85, -- доля от высоты экрана (0..1) или число строк
        border   = "rounded",
        winblend = 0,
        zindex   = 60,
        winhl    = {
            Normal      = "NormalFloat",
            FloatBorder = "FloatBorder",
            CursorLine  = "Visual",
            SignColumn  = "NormalFloat",
        },
    },
}

local function is_markdown(buf)
    return vim.tbl_contains(opts.filetypes, vim.bo[buf].filetype)
end

-- "A#B#C" → "A > B > C" (экранированный \# сохраняем)
local function _to_breadcrumb(s)
    s = s or ""
    local parts, buf = {}, {}
    local i, n = 1, #s
    local function trim(x) return (x:gsub("^%s+", ""):gsub("%s+$", "")) end
    while i <= n do
        local ch = s:sub(i, i)
        if ch == "\\" and s:sub(i + 1, i + 1) == "#" then
            table.insert(buf, "#"); i = i + 2
        elseif ch == "#" then
            local seg = trim(table.concat(buf)); if seg ~= "" then parts[#parts + 1] = seg end
            buf = {}; i = i + 1
        else
            table.insert(buf, ch); i = i + 1
        end
    end
    local last = (table.concat(buf):gsub("^%s+", ""):gsub("%s+$", ""))
    if last ~= "" then parts[#parts + 1] = last end
    return table.concat(parts, " > ")
end

local function _clean_target(t)
    if not t or t == "" then return "" end
    t = t:gsub("%.md$", ""):gsub("%^.*$", "")
    t = t:match("([^/\\]+)$") or t
    return (t:gsub("_", " "))
end

local function wikilink_label(body)
    local target, alias = body:match("^(.-)|(.+)$")
    return alias or _clean_target(target or _to_breadcrumb(body))
end

-- ===== parse =====
local function parse_outline(bufnr)
    local lines   = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local items   = {}
    local in_code = false
    local stack   = {}
    local function push(level) table.insert(stack, level) end
    local function pop_to(level) while #stack > 0 and stack[#stack] >= level do table.remove(stack) end end
    local function cur_depth() return #stack - 1 end
    local function child_depth() return math.max(0, cur_depth() + 1) end

    for i, s in ipairs(lines) do
        local lnum = i
        local fence = s:match("^%s*```") or s:match("^%s*~~~")
        if fence then in_code = not in_code end
        if in_code then goto continue end

        -- ATX headings
        local hashes, text = s:match("^%s*(#+)%s*(.+)")
        if hashes then
            local level = #hashes
            if not opts.max_level or level <= opts.max_level then
                text = text:gsub("%s*#+%s*$", "")
                if opts.wikilinks then
                    text = text:gsub("!%[%[([^%]]-)%]%]", function(b) return wikilink_label(b) end)
                    text = text:gsub("%[%[([^%]]-)%]%]", function(b) return wikilink_label(b) end)
                end
                pop_to(level); push(level)
                items[#items + 1] = {
                    kind = "heading",
                    level = level,
                    depth = math.max(0, cur_depth()),
                    text = text,
                    lnum =
                        lnum
                }
            end
        end

        if opts.wikilinks then
            local tmp = s
            tmp = tmp:gsub("!%[%[([^%]]-)%]%]", function(b)
                items[#items + 1] = { kind = "embed", depth = child_depth(), text = wikilink_label(b), lnum = lnum }
                return ""
            end)
            tmp:gsub("%[%[([^%]]-)%]%]", function(b)
                items[#items + 1] = { kind = "link", depth = child_depth(), text = wikilink_label(b), lnum = lnum }
            end)
        end
        ::continue::
    end
    return items
end

-- ===== popup =====
local function float_conf()
    local cols, lines = vim.o.columns, vim.o.lines
    local w = opts.float.width; if w <= 1 then w = math.max(30, math.floor(cols * w)) end
    local h = opts.float.height; if h <= 1 then h = math.max(10, math.floor(lines * h)) end
    local row = math.floor((lines - h) / 2)
    local col = math.floor((cols - w) / 2)
    return {
        relative = "editor",
        style = "minimal",
        border = opts.float.border,
        zindex = opts.float.zindex,
        noautocmd = true,
        width = w,
        height = h,
        row = row,
        col = col,
    }
end

local function ensure_outline_for(src_buf)
    local st = states[src_buf]
    if st and st.win and vim.api.nvim_win_is_valid(st.win) and st.buf and vim.api.nvim_buf_is_valid(st.buf) then
        return st
    end
    local buf                                                           = vim.api.nvim_create_buf(false, true)
    local win                                                           = vim.api.nvim_open_win(buf, true, float_conf()) -- всегда в фокус

    vim.bo[buf].buftype                                                 = "nofile"
    vim.bo[buf].bufhidden                                               = "wipe"
    vim.bo[buf].swapfile                                                = false
    vim.bo[buf].modifiable                                              = false
    vim.bo[buf].filetype                                                = "mdoutline"

    local wo                                                            = vim.wo[win]
    wo.wrap, wo.number, wo.relativenumber, wo.cursorline, wo.signcolumn = false, false, false, true, "no"
    wo.winblend                                                         = opts.float.winblend
    local winhl                                                         = {}
    for k, v in pairs(opts.float.winhl or {}) do winhl[#winhl + 1] = k .. ":" .. v end
    if #winhl > 0 then wo.winhl = table.concat(winhl, ",") end

    -- локальные кеймапы
    local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs,
            { buffer = buf, silent = true, nowait = true, desc = desc })
    end
    map("q", function() M.close(src_buf) end, "Close outline")
    map("r", function() M.refresh(src_buf) end, "Refresh outline")
    map("<CR>", function()
        M.jump_at_cursor(src_buf)

        local ok, ufo = pcall(require, 'ufo')
        if ok then
            local cur  = vim.api.nvim_win_get_cursor(0)[1]
            local last = vim.api.nvim_buf_line_count(0)
            local lvl  = vim.fn.foldlevel(cur)
            local next = (cur < last) and vim.fn.foldlevel(cur + 1) or 0
            if lvl == 0 and next == 0 then
                return
            end

            ufo.closeAllFolds()           -- закрыть всё (без изменения foldlevel)
            vim.cmd('silent! normal! zv') -- раскрыть родителей и заголовок текущего
            vim.cmd('silent! normal! zO') -- раскрыть всё поддерево текущей секции
        else
            return
        end
    end, "Jump to heading")

    -- реагировать на :VimResized — перепозиционировать
    local grp = vim.api.nvim_create_augroup("MdOutlineFloat:" .. src_buf, { clear = true })
    vim.api.nvim_create_autocmd("VimResized", {
        group = grp,
        callback = function()
            if vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_set_config(win, float_conf())
            end
        end,
    })

    states[src_buf] = { win = win, buf = buf, items = {} }
    return states[src_buf]
end

-- ===== render / jump =====
local function render(src_buf)
    local st = states[src_buf]; if not st then return end
    if not (vim.api.nvim_win_is_valid(st.win) and vim.api.nvim_buf_is_valid(st.buf)) then return end
    local lines, marks = {}, {}

    for i, it in ipairs(st.items or {}) do
        local depth  = math.max(0, it.depth or 0)
        local indent = string.rep("  ", depth)
        local icon   = (it.kind == "heading" and (opts.icons.heading[math.min(depth + 1, #opts.icons.heading)] or "•"))
            or (it.kind == "embed" and (opts.icons.embed or "󰈔"))
            or (opts.icons.link or "󰌹")
        lines[i]     = ("%s%s %s"):format(indent, icon, it.text)
        marks[i]     = it.lnum
    end

    vim.bo[st.buf].modifiable = true
    vim.api.nvim_buf_set_lines(st.buf, 0, -1, false, lines)
    vim.api.nvim_buf_clear_namespace(st.buf, ns, 0, -1)
    vim.bo[st.buf].modifiable = false
end

local function any_win_for_buf(buf)
    local wins = vim.fn.win_findbuf(buf)
    return (wins and wins[1]) or nil
end

-- ===== public =====
function M.open()
    local src = vim.api.nvim_get_current_buf()
    if not is_markdown(src) then
        return vim.notify("mdoutline: not a markdown buffer", vim.log.levels.WARN)
    end
    local st = ensure_outline_for(src)
    st.items = parse_outline(src)
    render(src)
end

function M.close(src)
    src = src or vim.api.nvim_get_current_buf()
    local st = states[src]
    if st and st.win and vim.api.nvim_win_is_valid(st.win) then pcall(vim.api.nvim_win_close, st.win, true) end
    states[src] = nil
end

function M.toggle()
    local src = vim.api.nvim_get_current_buf()
    local st  = states[src]
    if st and st.win and vim.api.nvim_win_is_valid(st.win) then M.close(src) else M.open() end
end

function M.refresh(src)
    src = src or vim.api.nvim_get_current_buf()
    local st = states[src]; if not st then return end
    st.items = parse_outline(src)
    render(src)
end

function M.jump_at_cursor(src)
    src = src or vim.api.nvim_get_current_buf()
    local st = states[src]; if not st then return end
    if not (st.win and vim.api.nvim_win_is_valid(st.win)) then return end
    local idx  = vim.api.nvim_win_get_cursor(st.win)[1]
    local item = st.items[idx]; if not item then return end

    -- перейти к исходному буферу (если он не виден — открыть его в текущем окне попапа)
    local src_win = any_win_for_buf(src)
    if not src_win then
        -- заменим попап текущим окном на исходный буфер
        vim.api.nvim_win_set_buf(st.win, src)
        src_win = st.win
    end
    vim.api.nvim_set_current_win(src_win)
    vim.api.nvim_win_set_cursor(src_win, { item.lnum, 0 })
    -- Можно закрыть попап после прыжка:
    M.close(src)
end

function M.setup(user)
    if user then opts = vim.tbl_deep_extend("force", opts, user) end
    vim.api.nvim_create_user_command("MdOutlineOpen", function() M.open() end, {})
    vim.api.nvim_create_user_command("MdOutlineClose", function() M.close() end, {})
    vim.api.nvim_create_user_command("MdOutlineToggle", function() M.toggle() end, {})
end

return M
