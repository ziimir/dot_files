local M = {}

local ns = vim.api.nvim_create_namespace("FoldCtxVText")
local opts = {}
local enabled = true
local pending

-- hl: либо таблица {name=""}, либо строка-имя группы
local function hl_name()
    return type(opts.hl) == "table" and opts.hl.name or (opts.hl or "FoldCtxVText")
end

-- ----- helpers ---------------------------------------------------------------
local function ft_allowed(buf)
    return vim.tbl_contains(opts.filetypes, vim.bo[buf].filetype)
end

-- текущий регион по фолдам (ufo/treesitter/indent)
local function current_fold_region(cur)
    local fc = vim.fn.foldclosed(cur)
    if fc ~= -1 then
        return fc, vim.fn.foldclosedend(cur)
    end
    local lvl = vim.fn.foldlevel(cur)
    if lvl == 0 then return nil end
    local top = cur
    while top > 1 and vim.fn.foldlevel(top - 1) >= lvl do top = top - 1 end
    local last = vim.api.nvim_buf_line_count(0)
    local bot = cur
    while bot < last and vim.fn.foldlevel(bot + 1) >= lvl do bot = bot + 1 end
    return top, bot
end

-- регион markdown-секции по Treesitter-заголовкам
local function md_section_bounds(buf, row1)
    local ok_ts, ts = pcall(require, "vim.treesitter"); if not ok_ts then return nil end
    local ok_p, parser = pcall(ts.get_parser, buf, "markdown"); if not ok_p or not parser then return nil end

    local function atx_level(node)
        local m = node:child(0); if not m then return nil end
        local srow, scol, erow, ecol = m:range()
        local text = table.concat(vim.api.nvim_buf_get_text(buf, srow, scol, erow, ecol, {}))
        local hashes = text:match("^%s*(#+)"); return hashes and #hashes or nil
    end
    local function setext_level(node)
        local u = node:child(1); if not u then return nil end
        local srow, scol, erow, ecol = u:range()
        local text = table.concat(vim.api.nvim_buf_get_text(buf, srow, scol, erow, ecol, {}))
        if text:find("^%s*==+") then return 1 end
        if text:find("^%s*%-%-+") then return 2 end
        return nil
    end
    local function heading_level(node)
        local t = node:type()
        if t == "atx_heading" then return atx_level(node) end
        if t == "setext_heading" then return setext_level(node) end
    end

    local tree = parser:parse()[1]; if not tree then return nil end
    local root = tree:root()
    local row0 = row1 - 1

    local top_node, level
    local function scan_up(node)
        for child in node:iter_children() do
            if child:range() > row0 then break end
            local typ = child:type()
            if (typ == "atx_heading" or typ == "setext_heading") and child:end_() <= row1 then
                local lev = heading_level(child); if lev then top_node, level = child, lev end
            end
            scan_up(child)
        end
    end
    scan_up(root)
    if not top_node then return nil end
    local top_row = top_node:range() + 1

    local last = vim.api.nvim_buf_line_count(buf)
    local next_row = last + 1
    local function scan_down(node)
        for child in node:iter_children() do
            local srow = child:range()
            if srow <= top_node:range() then
                scan_down(child)
            else
                local typ = child:type()
                if typ == "atx_heading" or typ == "setext_heading" then
                    local lev = heading_level(child)
                    if lev and lev <= level then
                        next_row = math.min(next_row, srow); return
                    end
                end
                scan_down(child)
            end
        end
    end
    scan_down(root)

    local bottom = (next_row == last + 1) and last or next_row
    return top_row, bottom
end

-- ----- render ----------------------------------------------------------------
local function render(win)
    win = win or 0
    local buf = vim.api.nvim_win_get_buf(win)
    vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
    if not enabled then return end
    if not ft_allowed(buf) then return end

    local cur = vim.api.nvim_win_get_cursor(win)[1]
    local s, e
    if opts.folds == "headings" then
        s, e = md_section_bounds(buf, cur); if not s or not e then return end
    else
        s, e = current_fold_region(cur); if not s or not e then return end
    end

    local vtext = { { opts.char, hl_name() } }
    for lnum = s, e do
        vim.api.nvim_buf_set_extmark(buf, ns, lnum - 1, 0, {
            virt_text = vtext,
            virt_text_pos = "inline", -- сдвигает текст вправо
            hl_mode = "combine",
            priority = 150,
        })
    end
end

local function schedule_update()
    if pending then
        pending:stop(); pending = nil
    end
    pending = vim.defer_fn(function()
        if vim.api.nvim_win_is_valid(0) then render(0) end
    end, opts.throttle_ms or 10)
end

-- ----- public ----------------------------------------------------------------
function M.setup(user)
    opts = vim.tbl_deep_extend("force", {
        folds = "headings",
        filetypes = { "markdown" },
        char = "▎ ",
        hl = { name = "FoldCtxVText", fg = "#7aa2f7" },
        throttle_ms = 10,
    }, user or {})

    -- выставить hl (если передали таблицу цветом)
    if type(opts.hl) == "table" and opts.hl.name then
        vim.api.nvim_set_hl(0, opts.hl.name, { fg = opts.hl.fg or "#7aa2f7", bg = opts.hl.bg, bold = opts.hl.bold })
    end

    local grp = vim.api.nvim_create_augroup("FoldCtxVText", { clear = true })
    vim.api.nvim_create_autocmd(
        { "BufEnter", "BufWinEnter", "CursorMoved", "CursorMovedI",
            "InsertLeave", "TextChanged", "TextChangedI", "WinScrolled" },
        { group = grp, callback = schedule_update }
    )
    vim.api.nvim_create_autocmd("OptionSet", {
        group = grp,
        pattern = { "foldlevel", "foldmethod", "foldenable", "foldexpr" },
        callback = schedule_update,
    })
    vim.api.nvim_create_autocmd("InsertEnter", {
        group = grp,
        callback = function()
            local buf = vim.api.nvim_get_current_buf()
            vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
        end,
    })
end

function M.enable()
    enabled = true; schedule_update()
end

function M.disable()
    enabled = false; vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
end

function M.toggle()
    enabled = not enabled; if enabled then schedule_update() else M.disable() end
end

function M.set_mode(mode) opts.folds = (mode == "all") and "all" or "headings" end

function M.set_filetypes(list) opts.filetypes = list or { "markdown" } end

function M.update_now() render(0) end

return M
