if vim.g.loaded_mdoutline then return end
vim.g.loaded_mdoutline = true

local ok, mdol = pcall(require, "mdoutline")
if not ok then return end

mdol.setup({
    side = "right",
    width = 32,
    focus = false,
    max_level = nil, -- например, 3, чтобы показывать до H3
    auto_update = true,
    throttle_ms = 60,
})

-- хоткей (можешь поменять на свой)
vim.keymap.set("n", "<leader>oo", "<cmd>MdOutlineToggle<CR>", { desc = "Markdown Outline" })
