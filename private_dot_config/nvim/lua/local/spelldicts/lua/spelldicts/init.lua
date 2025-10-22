local M = {}

function M.spell_dicts_update()
    local data = vim.fn.stdpath("data") .. "/cspell"
    local ext  = data .. "/node_modules/@cspell/dict-ru_ru/cspell-ext.json"

    -- уже стоит? выходим
    if vim.uv.fs_stat(ext) then
        print("[cspell] ru dict уже установлен → " .. ext)
        return
    end

    if vim.fn.executable("npm") ~= 1 then
        vim.notify("npm не найден в PATH (пропускаю установку @cspell/dict-ru_ru)", vim.log.levels.WARN)
        return
    end

    vim.fn.mkdir(data, "p")

    -- ставим словарь
    vim.notify("Устанавливаю @cspell/dict-ru_ru → " .. data)
    local res = vim.system({ "npm", "install", "--save-dev", "@cspell/dict-ru_ru" }, { cwd = data }):wait()
    if res.code == 0 and vim.uv.fs_stat(ext) then
        vim.notify("[cspell] Установлен: " .. ext)
    else
        vim.notify("[cspell] Сбой установки @cspell/dict-ru_ru (код " .. tostring(res.code) .. ")", vim.log.levels.ERROR)
    end
end

return M
