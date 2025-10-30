return {
    "voldikss/vim-floaterm",
    init = function()
        vim.g.floaterm_autoclose = 0
        vim.g.floaterm_width = 0.9
        vim.g.floaterm_height = 0.9
        vim.g.floaterm_position = "center"

        vim.api.nvim_set_keymap("n", "<c-s>n", ":FloatermNew<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<c-s>s", ":FloatermToggle<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<c-s>q", ":FloatermKill<CR>", { noremap = true, silent = true })

        vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("t", "<c-s>s", "<C-\\><C-n>:FloatermToggle<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("t", "<c-s>q", "<C-\\><C-n>:FloatermKill<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("t", "<c-s>[", "<C-\\><C-n>:FloatermPrev<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("t", "<c-s>]", "<C-\\><C-n>:FloatermNext<CR>", { noremap = true, silent = true })
    end
}
