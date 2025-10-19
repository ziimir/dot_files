local M = {}

local core = require("foldctx.vtext")

local defaults = {
    folds = "all", -- "all" | "headings"
    filetypes = { "markdown" }, -- где включать
    char = "▎ ", -- индикатор + небольшой зазор
    hl = { name = "FoldCtxVText", fg = "#7aa2f7" }, -- подсветка
    throttle_ms = 10, -- троттлинг перерисовки
    enabled = true,
}

M._opts = vim.deepcopy(defaults)

local function define_hl(hl)
    if type(hl) == "table" and hl.name then
        vim.api.nvim_set_hl(0, hl.name, { fg = hl.fg or "#7aa2f7", bold = hl.bold, bg = hl.bg })
    elseif type(hl) == "string" then
        -- строка = имя готовой группы темы
        M._opts.hl = { name = hl }
    end
end

function M.setup(opts)
    M._opts = vim.tbl_deep_extend("force", M._opts, opts or {})
    define_hl(M._opts.hl)
    core.setup(M._opts)
    M._define_commands()
    if M._opts.enabled then core.enable() else core.disable() end
end

function M.enable() core.enable() end

function M.disable() core.disable() end

function M.toggle() core.toggle() end

function M.mode(mode) -- "all" | "headings"
    core.set_mode(mode); core.update_now()
end

function M.filetypes(list) -- заменить список filetypes
    core.set_filetypes(list); core.update_now()
end

function M._define_commands()
    vim.api.nvim_create_user_command("FoldCtxEnable", function() M.enable() end, {})
    vim.api.nvim_create_user_command("FoldCtxDisable", function() M.disable() end, {})
    vim.api.nvim_create_user_command("FoldCtxToggle", function() M.toggle() end, {})
    vim.api.nvim_create_user_command("FoldCtxMode", function(cmd)
        local m = (cmd.args == "all") and "all" or "headings"
        M.mode(m)
        vim.notify("FoldCtx mode: " .. m)
    end, { nargs = 1, complete = function() return { "all", "headings" } end })
end

return M
