-- no backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.termguicolors = true

-- coc.vim: having longer updatetime (default is 4000 ms = 4s) leads to noticeable delays and poor user experience
vim.opt.updatetime = 300

vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.opt.history = 500
vim.opt.ruler = true
vim.opt.number = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.diffopt = vim.opt.diffopt + "vertical"
vim.opt.showmode = false
vim.opt.hidden = true -- allow buffer switching without saving
vim.opt.conceallevel = 0 -- always show all syntax symbols
vim.opt.laststatus = 3 -- only one window has status line https://www.youtube.com/watch?v=jH5PNvJIa6o
vim.wo.wrap = false

vim.g.mapleader="," -- leader button

vim.cmd [[set clipboard=unnamedplus]]
vim.cmd [[set guicursor=]] -- use original cursor in nvim

vim.opt.list = true
vim.opt.listchars = {tab = "▸ ", eol = "¬",  trail = "•"}
vim.cmd [[highlight SpecialKey ctermfg=NONE guifg=NONE]]

-- clear search
vim.api.nvim_set_keymap("n", "<leader><esc>", ":noh<CR>", {})

-- ctrl+a like in terminal
vim.api.nvim_set_keymap("c", "<C-a>", "<Home>", {})

-- copy filepath, inspired by https://github.com/vim-scripts/copypath.vim
vim.api.nvim_create_user_command(
    "CopyPath",
    function()
        vim.cmd [[let @*=expand("%:r")]]
    end,
    { nargs = 0 }
)

vim.api.nvim_create_user_command(
    "CopyFileName",
    function()
        vim.cmd [[let @*=expand("%:t:r")]]
    end,
    { nargs = 0 }
)

vim.keymap.set(
    'n',
    '<Leader>r',
    function()
        local word = vim.fn.expand("<cword>");

        local cmd = "%s/\\<" .. word .. "\\>//gc"
        local left = vim.api.nvim_replace_termcodes("<Left>", true, false, true)
        local movement = left:rep(3)

        vim.fn.feedkeys(":" .. cmd .. movement, "n")
    end
)
