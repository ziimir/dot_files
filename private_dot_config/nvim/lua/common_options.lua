require('common_fn')

-- no backup
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.history = 500
vim.opt.ruler = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.diffopt = vim.opt.diffopt + 'vertical'
vim.opt.showmode = false
vim.opt.hidden = true -- allow buffer switching without saving
vim.opt.conceallevel = 0 -- always show all syntax symbols
vim.opt.laststatus = 3 -- only one window has status line https://www.youtube.com/watch?v=jH5PNvJIa6o
vim.wo.wrap = false

vim.g.mapleader=',' -- leader button

cmd [[set clipboard+=unnamedplus]]
cmd [[set guicursor=]] -- use original cursor in nvim

vim.opt.list = true
vim.opt.listchars = {tab = '▸ ', eol = '¬',  trail = '•'}
cmd [[highlight SpecialKey ctermfg=NONE guifg=NONE]]

-- clear search
vim.api.nvim_set_keymap('n', '<leader><esc>', ':noh<CR>', {})

-- quickfix navigation
vim.api.nvim_set_keymap('n', ']q', ':cnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[q', ':cprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ']Q', ':clast<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Q', ':cfirst<CR>', {noremap = true, silent = true})

-- folding
vim.opt.foldlevelstart = 99 -- start file with all folds opened
vim.api.nvim_set_keymap('n', '<BS>', 'zc', {})
vim.api.nvim_set_keymap('n', '<CR>', 'zo', {})

-- copy filepath, inspired by https://github.com/vim-scripts/copypath.vim
vim.api.nvim_create_user_command(
    'CopyPath',
    function()
        cmd [[let @*=expand('%:r')]]
    end,
    {nargs = 0}
)

vim.api.nvim_create_user_command(
    'CopyFileName',
    function()
        cmd [[let @*=expand('%:t:r')]]
    end,
    {nargs = 0}
)
