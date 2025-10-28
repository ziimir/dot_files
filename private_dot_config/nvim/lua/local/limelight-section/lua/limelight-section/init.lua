local M = {}

local state = {
    enabled = false,
    last = { buf = nil, s = nil, e = nil },
    pending = nil,
    ft = { "markdown" },
    throttle_ms = 50,
}

local function in_list(list, x)
    for _, v in ipairs(list) do if v == x then return true end end
    return false
end

local function is_floating(win)
    local cfg = vim.api.nvim_win_get_config(win)
    return cfg and cfg.relative and cfg.relative ~= ""
end

-- --- Treesitter индекс заголовков -------------------------------------------
local index_cache = {} -- buf -> { tick, items = { {row, level}... } }

local function build_headings_index(buf)
    local ok_ts, ts = pcall(require, "vim.treesitter"); if not ok_ts then return nil end
    local parser = ts.get_parser(buf, "markdown"); if not parser then return nil end
    local tree = parser:parse()[1]; if not tree then return nil end
    local root = tree:root()

    local ok_q, query = pcall(ts.query.parse, "markdown", [[
    (atx_heading) @h
    (setext_heading) @s
  ]])
    if not ok_q then return nil end

    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local function atx_level(line)
        local hashes = line:match("^%s*(#+)")
        return hashes and #hashes or nil
    end
    local function setext_level(under)
        if under:match("^%s*==+%s*$") then return 1 end
        if under:match("^%s*%-%-+%s*$") then return 2 end
        return nil
    end

    local items = {}
    for id, node in query:iter_captures(root, buf, 0, -1) do
        local name = query.captures[id]
        local srow = node:range() + 1
        local lvl
        if name == "h" then
            lvl = atx_level(lines[srow] or "")
        else
            local under = lines[srow + 1] or ""
            lvl = setext_level(under)
        end
        if lvl then
            table.insert(items, { row = srow, level = lvl })
        end
    end
    table.sort(items, function(a, b) return a.row < b.row end)
    return items
end

local function get_headings_index(buf)
    local tick = vim.b[buf].changedtick
    local cache = index_cache[buf]
    if cache and cache.tick == tick then return cache.items end
    local items = build_headings_index(buf) or {}
    index_cache[buf] = { tick = tick, items = items }
    return items
end

-- --- Поиск секции ------------------------------------------------------------
local function section_bounds_for_row(buf, row)
    local items = get_headings_index(buf)
    if #items == 0 then return nil end

    -- найдём последний heading с row <= cursor
    local i = nil
    for idx = #items, 1, -1 do
        if items[idx].row <= row then
            i = idx; break
        end
    end
    if not i then return nil end

    local cur = items[i]
    local s = cur.row
    local e
    for j = i + 1, #items do
        if items[j].level <= cur.level then
            e = items[j].row - 1
            break
        end
    end
    if not e then
        e = vim.api.nvim_buf_line_count(buf)
    end
    return s, e
end

-- --- Limelight применение -----------------------------------------------------
local function apply_range(s, e)
    -- сбросить предыдущее затемнение
    pcall(vim.cmd, "silent! Limelight!")
    -- подсветить только диапазон (включая заголовок)
    pcall(vim.cmd, string.format("%d,%dLimelight", s, e))
end

local function update()
    if not state.enabled then return end
    local win = 0
    if is_floating(win) then return end

    local buf = vim.api.nvim_get_current_buf()
    if vim.bo[buf].buftype ~= "" then return end
    if vim.b[buf].limelight_section_disable then return end -- уважим явный запрет (для попапов)
    if not in_list(state.ft, vim.bo[buf].filetype) then return end

    local row = vim.api.nvim_win_get_cursor(win)[1]
    local s, e = section_bounds_for_row(buf, row)

    if not s then
        -- нет заголовков — просто включим limelight на параграф
        pcall(vim.cmd, "silent! Limelight")
        state.last = { buf = buf, s = nil, e = nil }
        return
    end

    local L = state.last
    if L.buf ~= buf or L.s ~= s or L.e ~= e then
        apply_range(s, e)
        state.last = { buf = buf, s = s, e = e }
    end
end

local function schedule()
    if state.pending then
        state.pending:stop(); state.pending = nil
    end
    state.pending = vim.defer_fn(function()
        if vim.api.nvim_win_is_valid(0) then update() end
    end, state.throttle_ms)
end

-- --- Публичное API ------------------------------------------------------------
function M.setup(opts)
    opts = opts or {}
    if opts.filetypes then state.ft = opts.filetypes end
    if opts.throttle_ms then state.throttle_ms = opts.throttle_ms end

    local grp = vim.api.nvim_create_augroup("LimelightSectionTS", { clear = true })
    vim.api.nvim_create_autocmd(
        { "BufEnter", "CursorMoved", "CursorMovedI", "InsertLeave", "TextChanged", "TextChangedI", "WinScrolled" },
        { group = grp, callback = schedule }
    )
    vim.api.nvim_create_autocmd("ColorScheme", { group = grp, callback = update })
    -- если markdown-парсер подгрузился позже → перестроим индекс
    vim.api.nvim_create_autocmd("User", {
        group = grp,
        pattern = "TSUpdate",
        callback = function()
            index_cache[vim.api.nvim_get_current_buf()] = nil; schedule()
        end,
    })
end

function M.enable()
    state.enabled = true
    state.last = { buf = nil, s = nil, e = nil }
    update()
end

function M.disable()
    state.enabled = false
    pcall(vim.cmd, "silent! Limelight!")
end

function M.toggle()
    if state.enabled then M.disable() else M.enable() end
end

return M
