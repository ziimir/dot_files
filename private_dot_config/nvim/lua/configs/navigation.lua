require('common_fn')

-- tab navigation
vim.api.nvim_set_keymap('', '<C-l>', 'gt', {})
vim.api.nvim_set_keymap('', '<C-h>', 'gT', {})
vim.api.nvim_set_keymap('', '<C-k>', ':tabm +1<CR>', {})
vim.api.nvim_set_keymap('', '<C-j>', ':tabm -1<CR>', {})

use('easymotion/vim-easymotion')

use({
    'preservim/nerdtree',
    config = function()
        vim.g.NERDTreeQuitOnOpen = 1
        vim.g.NERDTreeShowHidden = 1
        vim.g.NERDTreeWinSize = 60
        vim.g.NERDTreeAutoDeleteBuffer = 1

        vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<CR>', {noremap = true})
        vim.api.nvim_set_keymap('n', '<C-\\>', ':NERDTreeFind<CR>', {noremap = true})
    end
})
