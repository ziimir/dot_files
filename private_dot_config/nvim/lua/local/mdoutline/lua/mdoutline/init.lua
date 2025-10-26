local M        = {}

-- ===== state / defaults ======================================================
local ns       = vim.api.nvim_create_namespace("mdoutline")
local states   = {} -- per-source-buf: { win, buf, items = { {lnum, level, text}... }, throttle }
local defaults = {
    side        = "right",
    width       = 32,
    focus       = false,
    max_level   = nil,
    -- иконки: заголовки по глубине (берём по depth+1), ссылки и эмбеды
    icons       = {
        heading = { "󰓹", "󰓹", "󰓹", "󰓹", "󰓹", "󰓹" },
        link    = "󰌹",
        embed   = "󰈔",
    },
    filetypes   = { "markdown" },
    auto_update = true,
    throttle_ms = 60,
    -- опция на всякий случай
    wikilinks   = true,
}

local opts     = vim.deepcopy(defaults)

local function is_markdown(buf)
    local ft = vim.bo[buf].filetype
    return vim.tbl_contains(opts.filetypes, ft)
end

-- "A#B#C"                     -> "A > B > C"
-- "A #  B"                    -> "A > B"
-- "A\\#B#C"                   -> "A#B > C"   (экранированный # сохраняется)
-- "#Heading" / "Note##Part"   -> "Heading" / "Note > Part" (пустые сегменты игнорим)
local function _to_breadcrumb(s)
    s = s or ""
    local parts, buf = {}, {}
    local i, n = 1, #s

    local function trim(x) return (x:gsub("^%s+", ""):gsub("%s+$", "")) end

    while i <= n do
        local ch = s:sub(i, i)
        if ch == "\\" then
            local nextch = s:sub(i + 1, i + 1)
            if nextch == "#" then
                table.insert(buf, "#") -- экранированный #
                i = i + 2
            else
                table.insert(buf, ch) -- обычный бэкслеш
                i = i + 1
            end
        elseif ch == "#" then
            local seg = trim(table.concat(buf))
            if seg ~= "" then table.insert(parts, seg) end
            buf = {}
            i = i + 1
        else
            table.insert(buf, ch)
            i = i + 1
        end
    end

    local last = trim(table.concat(buf))
    if last ~= "" then table.insert(parts, last) end

    return table.concat(parts, " > ")
end

-- извлечь читаемую подпись из тела вики-ссылки (target|alias → alias; path/Note.md#h → Note)
local function _clean_target(t)
    if not t or t == "" then return "" end
    t = t:gsub("%.md$", "")        -- убрать .md
    --t = t:gsub("#.*$", "")         -- убрать якорь
    t = t:gsub("%^.*$", "")        -- убрать block id
    t = t:match("([^/\\]+)$") or t -- basename
    t = t:gsub("_", " ")           -- подчёркивания → пробелы
    return t
end

local function wikilink_label(body)
    local target, alias = body:match("^(.-)|(.+)$")
    return alias or _clean_target(target or _to_breadcrumb(body))
end

-- ===== parsing ===============================================================
-- парсим документ: заголовки с depth по стеку + кросс-ссылки ([[...]] и ![[...]])
local function parse_outline(bufnr)
    local lines   = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local items   = {}
    local in_code = false

    -- стек markdown-уровней (1..6); depth = #stack - 1
    local stack   = {}
    local function push(level) table.insert(stack, level) end
    local function pop_to(level)
        while #stack > 0 and stack[#stack] >= level do
            table.remove(stack)
        end
    end
    local function cur_depth() return #stack - 1 end
    local function child_depth()
        local d = cur_depth()
        return (d >= 0) and (d + 1) or 0
    end

    for i, s in ipairs(lines) do
        local lnum = i

        -- fenced code blocks ``` / ~~~
        local fence = s:match("^%s*```") or s:match("^%s*~~~")
        if fence then in_code = not in_code end

        if not in_code then
            -- ===== Заголовки =====
            -- ATX: #### Title ####
            local hashes, text = s:match("^%s*(#+)%s*(.+)")
            if hashes then
                local level = #hashes
                if not opts.max_level or level <= opts.max_level then
                    text = text:gsub("%s*#+%s*$", "")
                    if opts.wikilinks then
                        text = text:gsub("!%[%[([^%]]-)%]%]", function(body) return wikilink_label(body) end)
                        text = text:gsub("%[%[([^%]]-)%]%]", function(body) return wikilink_label(body) end)
                    end
                    pop_to(level)
                    push(level)
                    local depth = math.max(0, cur_depth())
                    table.insert(items, { kind = "heading", level = level, depth = depth, text = text, lnum = lnum })
                end
            end

            -- ===== Кросс-ссылки (и на строке заголовка, и на обычной строке) =====
            if opts.wikilinks then
                -- сначала эмбеды: ![[...]]
                local tmp = s
                tmp = tmp:gsub("!%[%[([^%]]-)%]%]", function(body)
                    local label = wikilink_label(body)
                    table.insert(items, { kind = "embed", depth = child_depth(), text = label, lnum = lnum })
                    return "" -- чтобы не поймать второй раз как обычную ссылку
                end)
                -- затем обычные [[...]]
                tmp:gsub("%[%[([^%]]-)%]%]", function(body)
                    local label = wikilink_label(body)
                    table.insert(items, { kind = "link", depth = child_depth(), text = label, lnum = lnum })
                end)
            end
        end
    end

    return items
end

-- ===== outline buffer/window =================================================
local function ensure_outline_for(bufnr)
    local st = states[bufnr]
    if st and st.win and vim.api.nvim_win_is_valid(st.win) and st.buf and vim.api.nvim_buf_is_valid(st.buf) then
        return st
    end

    -- открыть сплит справа/слева
    local curwin = vim.api.nvim_get_current_win()
    if opts.side == "left" then
        vim.cmd("topleft vertical split")
    else
        vim.cmd("botright vertical split")
    end
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_width(win, opts.width)

    -- создать/подключить scratch-буфер
    local buf = vim.api.nvim_create_buf(false, true) -- [listed=false, scratch]
    vim.api.nvim_win_set_buf(win, buf)

    -- офорим окно
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false
    vim.bo[buf].modifiable = false
    vim.bo[buf].filetype = "mdoutline"
    vim.wo[win].wrap = false
    vim.wo[win].number = false
    vim.wo[win].relativenumber = false
    vim.wo[win].cursorline = true
    vim.wo[win].signcolumn = "no"

    -- кеймапы только в outline
    local function map(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = buf, silent = true, nowait = true, desc = desc })
    end
    map("q", function() M.close(bufnr) end, "Close outline")
    map("r", function() M.refresh(bufnr) end, "Refresh outline")
    map("<CR>", function() M.jump_at_cursor(bufnr) end, "Jump to heading")

    -- не забирать фокус (если надо)
    if not opts.focus then
        vim.api.nvim_set_current_win(curwin)
    end

    states[bufnr] = { win = win, buf = buf, items = {}, throttle = nil }
    return states[bufnr]
end

local function render(bufnr)
    local st = states[bufnr]
    if not st or not (st.win and vim.api.nvim_win_is_valid(st.win)) then return end
    if not (st.buf and vim.api.nvim_buf_is_valid(st.buf)) then return end
    local items = st.items or {}
    local lines = {}
    local marks = {}

    local pad_unit = "  "
    for idx, it in ipairs(items) do
        local depth = math.max(0, it.depth or 0)
        local indent = string.rep(pad_unit, depth)

        local icon
        if it.kind == "heading" then
            local arr = opts.icons.heading or {}
            icon = arr[math.min(depth + 1, #arr)] or arr[1] or "•"
        elseif it.kind == "embed" then
            icon = (opts.icons.embed or "󰈔")
        else -- "link"
            icon = (opts.icons.link or "󰌹")
        end

        lines[idx] = ("%s%s %s"):format(indent, icon, it.text)
        marks[idx] = it.lnum
    end

    vim.bo[st.buf].modifiable = true
    vim.api.nvim_buf_set_lines(st.buf, 0, -1, false, lines)
    vim.api.nvim_buf_clear_namespace(st.buf, ns, 0, -1)

    -- по одной метке на строку outline с исходным lnum
    for i, lnum in ipairs(marks) do
        vim.api.nvim_buf_set_extmark(st.buf, ns, i - 1, 0, {
            end_row = i - 1,
            end_col = 0,
            hl_group = "",  -- не подсвечиваем строку целиком
            virt_text = {}, -- пусто
            right_gravity = false,
            hl_mode = "combine",
            -- metadata: проложим через "details"
            -- (читаться будет через nvim_buf_get_extmarks / opts)
            -- нет прямого поля для meta, поэтому используем "virt_text_pos" = "overlay" хак? — не нужно.
        })
    end
    vim.bo[st.buf].modifiable = false
end

-- найти индекс активного заголовка по позиции курсора в source
local function find_active_index(items, curline)
    if #items == 0 then return nil end
    -- бинарный поиск: последний with lnum <= curline
    local lo, hi, ans = 1, #items, 1
    while lo <= hi do
        local mid = math.floor((lo + hi) / 2)
        if items[mid].lnum <= curline then
            ans = mid
            lo = mid + 1
        else
            hi = mid - 1
        end
    end
    return ans
end

local function sync_cursor(bufnr)
    local st = states[bufnr]
    if not st or not (st.win and vim.api.nvim_win_is_valid(st.win)) then return end
    local items = st.items
    if not items or #items == 0 then return end
    local cur = vim.api.nvim_win_get_cursor(vim.fn.bufwinid(bufnr) ~= -1 and vim.fn.bufwinid(bufnr) or 0)[1]
    local idx = find_active_index(items, cur)
    if not idx then return end
    -- переместим курсор в outline без фокуса
    pcall(vim.api.nvim_win_set_cursor, st.win, { idx, 0 })
end

-- ===== public API ============================================================
function M.open()
    local src = vim.api.nvim_get_current_buf()
    if not is_markdown(src) then
        vim.notify("mdoutline: not a markdown buffer", vim.log.levels.WARN)
        return
    end
    local st = ensure_outline_for(src)
    st.items = parse_outline(src)
    render(src)
    sync_cursor(src)
end

function M.close(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local st = states[bufnr]
    if st and st.win and vim.api.nvim_win_is_valid(st.win) then
        vim.api.nvim_win_close(st.win, true)
    end
    states[bufnr] = nil
end

function M.toggle()
    local src = vim.api.nvim_get_current_buf()
    local st = states[src]
    if st and st.win and vim.api.nvim_win_is_valid(st.win) then
        M.close(src)
    else
        M.open()
    end
end

function M.refresh(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local st = states[bufnr]
    if not st then return end
    st.items = parse_outline(bufnr)
    render(bufnr)
    sync_cursor(bufnr)
end

function M.jump_at_cursor(src_buf)
    src_buf = src_buf or vim.api.nvim_get_current_buf()
    local st = states[src_buf]; if not st then return end
    local owin = st.win; if not owin or not vim.api.nvim_win_is_valid(owin) then return end
    local obuf = st.buf
    local idx = vim.api.nvim_win_get_cursor(owin)[1]
    local item = st.items[idx]
    if not item then return end

    -- перейти в окно с исходным буфером
    local src_win = vim.fn.bufwinid(src_buf)
    if src_win == -1 then
        -- буфер закрыт в окнах? Откроем в текущем
        vim.api.nvim_set_current_win(owin)
        vim.cmd("wincmd p")
        src_win = vim.api.nvim_get_current_win()
        vim.api.nvim_win_set_buf(src_win, src_buf)
    end
    vim.api.nvim_set_current_win(src_win)
    vim.api.nvim_win_set_cursor(src_win, { item.lnum, 0 })
end

-- автосинхронизация/обновления
local function schedule(src)
    local st = states[src]
    if not st then return end
    if st.throttle then
        st.throttle:stop(); st.throttle = nil
    end
    st.throttle = vim.defer_fn(function()
        if states[src] then M.refresh(src) end
    end, opts.throttle_ms)
end

function M.attach_autocmds(src)
    if not opts.auto_update then return end
    local grp = vim.api.nvim_create_augroup("MdOutline:" .. src, { clear = true })
    vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI", "BufWritePost" }, {
        group = grp, buffer = src, callback = function() schedule(src) end,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        group = grp, buffer = src, callback = function() sync_cursor(src) end,
    })

    local ggrp = vim.api.nvim_create_augroup("MdOutline:global", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWinLeave", "BufDelete", "BufWipeout", "BufUnload" }, {
        group = ggrp,
        callback = function()
            for src, st in pairs(states) do
                -- если исходный буфер недействителен или не виден ни в одном окне — закрываем outline
                if (not vim.api.nvim_buf_is_valid(src)) or (#vim.fn.win_findbuf(src) == 0) then
                    M.close(src)
                end
            end
        end,
    })
end

function M.setup(user)
    opts = vim.tbl_deep_extend("force", opts, user or {})
    -- простая команда для ручного запуска
    vim.api.nvim_create_user_command("MdOutlineToggle", function()
        local src = vim.api.nvim_get_current_buf()
        if not states[src] then
            M.open()
            M.attach_autocmds(src)
        else
            M.toggle()
        end
    end, {})

    vim.api.nvim_create_user_command("MdOutlineOpen", function()
        local src = vim.api.nvim_get_current_buf()
        M.open()
        M.attach_autocmds(src)
    end, {})

    vim.api.nvim_create_user_command("MdOutlineClose", function()
        M.close()
    end, {})
end

return M
