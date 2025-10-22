if vim.g.loaded_spelldicts_plugin then return end
vim.g.loaded_spelldicts_plugin = true

-- всю «логику» держим в lua/spelldicts/init.lua
local M = require("spelldicts")

-- команда должна существовать уже при build
vim.api.nvim_create_user_command("SpellDictsUpdate", function()
    M.spell_dicts_update()
end, {})
