local M = {}
local core = require("wikipeek.core")

local defaults = {
    filetypes = { "markdown" }, -- где работать
    extra_roots = {},           -- доп. пути для поиска заметок (кроме vault'ов obsidian.nvim)
}

M._opts = vim.deepcopy(defaults)

function M.setup(opts)
    M._opts = vim.tbl_deep_extend("force", M._opts, opts or {})

    -- команда
    vim.api.nvim_create_user_command("WikilinkPeek", function()
        core.peek_under_cursor({ extra_roots = M._opts.extra_roots })
    end, {})
end

return M
