return {
    "mileszs/ack.vim",
    init = function()
        vim.g.ackprg = "ag --vimgrep"

        vim.cmd [[cnoreabbrev Ack Ack!]]
        vim.cmd [[cnoreabbrev AckAdd AckAdd!]]
        vim.cmd [[cnoreabbrev LAck LAck!]]
        vim.cmd [[cnoreabbrev LAckAdd LAckAdd!]]

        vim.api.nvim_set_keymap("n", "<Leader>g", ":Ack<Space>", {})
        vim.api.nvim_set_keymap("n", "<Leader>G", ":Ack<Space>\"\\b<cword>\\b\"<CR>", {})
    end
}
