local M = {}

-- ===== utils ================================================================
-- аккуратный lower для Unicode
local function u_lower(s)
    local ok, lo = pcall(function() return vim.fn.tolower(s) end)
    return ok and lo or string.lower(s or "")
end
local function trim(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end

-- схлопывание дефисов и обрезка по краям
local function normalize_dashes(s)
    return s:gsub("[–—]", "-") -- en/em dash → "-"
        :gsub("%-+", "-")
        :gsub("^%-", "")
        :gsub("%-$", "")
end

-- Obsidian-like slug: lower (Unicode), убрать апострофы,
-- ASCII-пунктуацию/пробелы/слэши → "-", затем схлопнуть дефисы
local function slugify_obsidian(text)
    text = u_lower(text or "")
    text = text:gsub("[’'`]", "") -- апострофы вон
    text = text:gsub("[–—]", "-") -- юникодные тире к '-'
    text = text:gsub("[%s%p/\\]+", "-") -- пробелы+ASCII-пунктуация+слэши → '-'
    text = normalize_dashes(text)
    return text
end

-- сравнение «как есть» (Unicode lower + trim)
local function norm(s)
    return trim(u_lower(s or "")):gsub("%s+", " ")
end

-- разбор строки с несколькими неэкранированными '#': "A#B#C" -> {"A","B","C"}
local function split_unescaped_hashes(s)
    local out, buf = {}, {}
    local i, n = 1, #s
    while i <= n do
        local ch = s:sub(i, i)
        if ch == "\\" and s:sub(i + 1, i + 1) == "#" then
            table.insert(buf, "#"); i = i + 2
        elseif ch == "#" then
            table.insert(out, trim(table.concat(buf))); buf = {}; i = i + 1
        else
            table.insert(buf, ch); i = i + 1
        end
    end
    table.insert(out, trim(table.concat(buf)))
    -- уберем пустые сегменты (из "A##B")
    local clean = {}
    for _, seg in ipairs(out) do if seg ~= "" then table.insert(clean, seg) end end
    return clean
end

-- матч заголовка: по "сырому" тексту или obsidian-slug
local function heading_match(text, wanted)
    local raw         = norm(text)
    local slug        = slugify_obsidian(text)
    local wanted_raw  = norm(wanted)
    local wanted_slug = normalize_dashes(slugify_obsidian(wanted))
    return (raw == wanted_raw) or (slug == wanted_slug)
end

-- парс заголовка в строке: возвращает (is_heading, level, text)
local function heading_info_at_line(lines, i)
    local line = lines[i]
    local hashes, rest = line:match("^%s*(#+)%s*(.*)$")
    if hashes then
        rest = rest:gsub("%s*#+%s*$", "")
        return true, #hashes, rest
    end
    if i < #lines then
        local underline = lines[i + 1]
        if underline:match("^%s*==+%s*$") then return true, 1, line end
        if underline:match("^%s*%-%-+%s*$") then return true, 2, line end
    end
    return false
end

-- найти заголовок wanted в диапазоне [from_i .. to_i]
local function find_heading_in_range(lines, from_i, to_i, wanted)
    for i = from_i, to_i do
        local is_h, level, text = heading_info_at_line(lines, i)
        if is_h and heading_match(text, wanted) then
            return i, level
        end
    end
    return nil
end

-- конец секции: до следующего заголовка уровня <= level или конца диапазона
local function section_end_in_range(lines, start_i, level, to_i)
    local j = start_i + 1
    while j <= to_i do
        local is_h, lv = heading_info_at_line(lines, j)
        if is_h and lv <= level then return j - 1 end
        j = j + 1
    end
    return to_i
end

-- найти секцию по ПУТИ заголовков: {"have-to","Необязательность"}
local function section_bounds_by_path(lines, path)
    local from_i, to_i = 1, #lines
    local start_i, level, end_i

    for idx, seg in ipairs(path) do
        local si, lv = find_heading_in_range(lines, from_i, to_i, seg)
        if not si then return nil end
        start_i, level = si, lv
        end_i = section_end_in_range(lines, start_i, level, to_i)
        -- следующий поиск — внутри найденной секции, начиная со строки после заголовка
        from_i, to_i = start_i + 1, end_i
    end

    -- если путь из одного сегмента — вернуть всю секцию; если из нескольких — вернуть секцию последнего сегмента
    return start_i, end_i
end

-- найти wikilink под курсором: [[...]] (с опциональным ! перед [[)
local function wikilink_under_cursor()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2] + 1

    local search_from = 1
    while true do
        local s = line:find("%[%[", search_from)
        if not s then return nil end
        local e = line:find("%]%]", s + 2)
        if not e then return nil end
        if col >= s and col <= e then
            local embed = (s > 1) and line:sub(s - 1, s - 1) == "!"
            local inner = line:sub(s + 2, e - 1)
            -- распарсим alias: первый неэкранированный |
            local alias_i
            do
                local j = 1
                while j <= #inner do
                    local ch = inner:sub(j, j)
                    local prev = j > 1 and inner:sub(j - 1, j - 1) or ""
                    if ch == "|" and prev ~= "\\" then
                        alias_i = j; break
                    end
                    j = j + 1
                end
            end
            local main = alias_i and inner:sub(1, alias_i - 1) or inner

            -- РАЗБОР ЦЕПОЧКИ заголовков:
            local chunks = split_unescaped_hashes(main) -- {"Note","have-to","Необязательность"} или {"#Local"} → {"","Local"}
            local title = chunks[1] or ""
            local heading_path = {}
            for i2 = 2, #chunks do heading_path[#heading_path + 1] = chunks[i2] end

            title = trim(title):gsub("\\|", "|")

            -- особый случай [[#Heading...]] — текущий файл
            if title == "" and #heading_path > 0 then
                local curpath = vim.api.nvim_buf_get_name(0)
                return { embed = embed, title = nil, heading_path = heading_path, current_path = curpath }
            end

            return { embed = embed, title = title, heading_path = heading_path }
        end
        search_from = e + 1
    end
end

-- получить корни vault'ов из obsidian.nvim (если есть)
local function get_obsidian_roots(extra_roots)
    local roots = {}

    -- a) из настроек obsidian.nvim
    local ok, Obs = pcall(require, "obsidian")
    if ok and Obs and Obs.opts and Obs.opts.workspaces then
        local function to_str(p)
            if type(p) == "string" then return p end
            local ok_s, s = pcall(function() return tostring(p) end)
            if ok_s and type(s) == "string" and s ~= "" then return s end
            if type(p) == "table" then
                return p.path or p.dir or p.root or p.filename
            end
            return nil
        end
        for _, ws in pairs(Obs.opts.workspaces) do
            local raw = ws and to_str(ws.path)
            if type(raw) == "string" and raw ~= "" then
                table.insert(roots, vim.fs.normalize(vim.fn.expand(raw)))
            end
        end
    end

    -- b) если всё ещё пусто — найдём vault по текущему буферу (ищем .obsidian)
    if #roots == 0 then
        local cur = vim.api.nvim_buf_get_name(0)
        if cur ~= "" then
            local dir = vim.fs.dirname(cur)
            local vault_root = vim.fs.find(".obsidian", { path = dir, upward = true, type = "directory", limit = 1 })[1]
            if vault_root then
                table.insert(roots, vim.fs.dirname(vault_root))
            end
        end
    end

    -- c) добавим extra_roots (если переданы из setup)
    if type(extra_roots) == "table" then
        for _, r in ipairs(extra_roots) do
            if type(r) == "string" and r ~= "" then
                table.insert(roots, vim.fs.normalize(vim.fn.expand(r)))
            end
        end
    end

    -- dedup
    local seen, uniq = {}, {}
    for _, r in ipairs(roots) do
        if not seen[r] then
            seen[r] = true; table.insert(uniq, r)
        end
    end
    return uniq
end

-- найти файл заметки по title в корнях vault'ов
local function find_note_path(title, extra_roots)
    if not title or title == "" then return nil end
    local roots = get_obsidian_roots(extra_roots)
    if #roots == 0 then return nil end

    -- 1) точное имя (case-sensitive) "<title>.md"
    for _, root in ipairs(roots) do
        local hit = vim.fs.find(title .. ".md", { path = root, type = "file", limit = 1 })
        if #hit > 0 then return hit[1] end
    end

    -- 2) case-insensitive по basename
    local tl = title:lower()
    for _, root in ipairs(roots) do
        local found = vim.fs.find(function(name, path)
            local full = ((path and path ~= "" and (path .. "/")) or "") .. name
            local bn = vim.fs.basename(full):lower()
            return bn == tl or bn == (tl .. ".md")
        end, { path = root, type = "file", limit = 1 })
        if #found > 0 then return found[1] end
    end

    return nil
end

-- найти границы секции по имени заголовка (ATX/Setext)
local function section_bounds_by_heading(lines, wanted_heading)
    local n = #lines
    local found_i, found_level

    -- что ищем: и «сырой» текст, и slug
    local wanted_raw = norm(wanted_heading)
    local wanted_slug = slugify_obsidian(wanted_heading)
    -- на всякий случай нормализуем дефисы в переданном slug (поддержим lets--lets-not)
    wanted_slug = normalize_dashes(wanted_slug:gsub("%-+", "-"))

    -- вспомогательные парсеры (как у тебя было)
    local function atx_heading(line)
        local hashes, rest = line:match("^%s*(#+)%s*(.*)$")
        if not hashes then return nil end
        rest = rest:gsub("%s*#+%s*$", "")
        return { level = #hashes, text = (rest or "") }
    end
    local function setext_underline(line)
        if line:match("^%s*==+%s*$") then return 1 end
        if line:match("^%s*%-%-+%s*$") then return 2 end
        return nil
    end

    -- 1) сначала ATX (# ...)
    for i = 1, n do
        local h = atx_heading(lines[i])
        if h then
            local raw = norm(h.text)
            local slug = slugify_obsidian(h.text)
            if raw == wanted_raw or slug == wanted_slug then
                found_i, found_level = i, h.level
                break
            end
        end
    end

    -- 2) если не нашли — Setext (строка + =====/-----)
    if not found_i then
        for i = 1, n - 1 do
            local lvl = setext_underline(lines[i + 1])
            if lvl then
                local raw = norm(lines[i])
                local slug = slugify_obsidian(lines[i])
                if raw == wanted_raw or slug == wanted_slug then
                    found_i, found_level = i, lvl
                    break
                end
            end
        end
    end

    if not found_i then return nil end

    -- низ секции — перед следующим заголовком уровня <= found_level
    local j = found_i + 1
    while j <= n do
        local h = atx_heading(lines[j])
        if h and h.level <= found_level then break end
        if j < n then
            local lvl = setext_underline(lines[j + 1])
            if lvl and lvl <= found_level then break end
        end
        j = j + 1
    end

    local to_ = (j <= n) and (j - 1) or n
    return found_i, to_
end

-- fallback, если заголовок не указан: весь файл
local function get_all(lines)
    local n = #lines
    return 1, n
end

-- открыть popup с переданными строками + Treesitter + render-markdown
local function open_popup(lines, title)
    -- 1) создаём нормальный "scratch" буфер
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- буферные опции
    vim.bo[buf].buftype    = "" -- обычный буфер (важно!)
    vim.bo[buf].bufhidden  = "wipe"
    vim.bo[buf].swapfile   = false
    vim.bo[buf].modifiable = false
    vim.bo[buf].filetype   = "markdown"

    -- 2) гарантируем Treesitter Markdown
    pcall(vim.treesitter.start, buf, "markdown")

    -- 3) своё окно (как у тебя было)
    local maxw                 = math.floor(vim.o.columns * 0.8)
    local maxh                 = math.floor(vim.o.lines * 0.8)
    local win                  = vim.api.nvim_open_win(buf, true, {
        relative  = "editor",
        style     = "minimal",
        border    = "single",
        noautocmd = true,
        zindex    = 60,
        width     = maxw,
        height    = maxh,
        row       = math.floor((vim.o.lines - maxh) / 2),
        col       = math.floor((vim.o.columns - maxw) / 2),
        title     = title and (" " .. title .. " ") or nil,
        title_pos = "center",
    })

    -- отключаем foldctx в этом буфере
    vim.b[buf].foldctx_disable = true
    pcall(function()
        require("foldctx").disable_in_buf(buf)
    end)

    -- 4) оконные опции; для таблиц лучше без переносов
    local function has_table(ls)
        for _, l in ipairs(ls) do if l:match("^%s*|") then return true end end
        return false
    end
    local tbl                = has_table(lines)
    vim.wo[win].wrap         = not tbl
    vim.wo[win].linebreak    = false
    vim.wo[win].breakindent  = false
    vim.wo[win].list         = false
    vim.wo[win].conceallevel = 2
    vim.wo[win].cursorline   = false
    vim.wo[win].foldenable   = false
    vim.wo[win].winblend     = 0

    -- 5) Включаем render-markdown ДЛЯ ЭТОГО буфера
    local ok, rm             = pcall(require, "render-markdown")
    if ok then
        local prev = vim.api.nvim_get_current_win()
        vim.api.nvim_set_current_win(win)
        -- включает рендер «буферно» (аналог команды :RenderMarkdown buf_enable)
        pcall(rm.buf_enable) -- или: pcall(vim.cmd, "RenderMarkdown buf_enable")
        vim.api.nvim_set_current_win(prev)
    end

    -- 6) закрытие по 'q'
    vim.keymap.set("n", "q", function()
        if vim.api.nvim_win_is_valid(win) then vim.api.nvim_win_close(win, true) end
    end, { buffer = buf, silent = true })

    return buf, win
end

-- ===== public ===============================================================

-- открыть секцию, на которую указывает wikilink под курсором
function M.peek_under_cursor(opts)
    opts = opts or {}
    local link = wikilink_under_cursor()
    if not link then
        return vim.notify("wikipeek: нет wikilink под курсором", vim.log.levels.INFO)
    end

    -- определить файл
    local path
    if link.current_path then
        path = link.current_path
    else
        path = find_note_path(link.title, opts.extra_roots or {})
    end
    if not path then
        return vim.notify("wikipeek: не найден файл '" .. (link.title or "<current>") .. "'", vim.log.levels.WARN)
    end

    local lines = vim.fn.readfile(path)
    if #lines == 0 then lines = { "(empty file)" } end

    local s, e
    if link.heading_path and #link.heading_path > 0 then
        s, e = section_bounds_by_path(lines, link.heading_path)
        if not s then
            return vim.notify("wikipeek: не найден путь заголовков '" .. table.concat(link.heading_path, " > ") .. "'",
                vim.log.levels.WARN)
        end
    else
        s, e = get_all(lines)
    end

    local chunk = {}
    for i = s, e do chunk[#chunk + 1] = lines[i] end
    local ttl = vim.fs.basename(path) .. (link.heading and (" • " .. link.heading) or "")
    open_popup(chunk, ttl)
end

return M
