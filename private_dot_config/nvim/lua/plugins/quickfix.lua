-- quickfix navigation
vim.api.nvim_set_keymap('n', ']q', ':cnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[q', ':cprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']Q', ':clast<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[Q', ':cfirst<CR>', { noremap = true, silent = true })

return {
    "romainl/vim-qf",
    {
        "kevinhwang91/nvim-bqf", -- instead of 'yssl/QFEnter'
        ft = "qf",
        config = function()
            require('bqf').setup({
                preview = {
                    auto_preview = false,
                    winblend = 0,
                    win_height = 999
                },
                func_map = {
                    pscrollup = '<C-y>',
                    pscrolldown = '<C-e>',
                    prevfile = '<C-f>[',
                    nextfile = '<C-f>]'
                }
            })

            local qfEnhancementGroup = vim.api.nvim_create_augroup('QfEnhancementGroup', { clear = true })
            vim.api.nvim_create_autocmd('FileType', {
                pattern = { 'qf' },
                callback = function()
                    vim.keymap.set('n', '<C-p>', 'k', { buffer = 0 })
                    vim.keymap.set('n', '<C-n>', 'j', { buffer = 0 })
                end,
                group = qfEnhancementGroup
            })
        end
    },
    {
        'stevearc/quicker.nvim',
        ft = "qf",
        opts = {
            opts = {
                buflisted = false,
                number = true,
                relativenumber = false,
                signcolumn = "auto",
                winfixheight = true,
                wrap = false,
            },
            edit = { enabled = false },
        },
    },
}
