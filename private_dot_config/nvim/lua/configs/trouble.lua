use({
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('trouble').setup({
            mode = 'quickfix'
        })

        local vimadeTroubleFixGroup = vim.api.nvim_create_augroup("VimadeTroubleFixGroup", { clear = true })
        vim.api.nvim_create_autocmd({'FileType', 'BufEnter'}, {
            pattern = 'Trouble',
            command = 'VimadeDisable',
            group = nodeCodeHelpersGroup
        })
        vim.api.nvim_create_autocmd('BufLeave', {
            pattern = 'Trouble',
            command = 'VimadeEnable',
            group = nodeCodeHelpersGroup
        })

        local bufopts = {silent = true, noremap = true}
        vim.api.nvim_set_keymap("n", "<space>q", ":Trouble quickfix<CR>", bufopts)
    end
})
