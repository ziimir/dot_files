require('common_fn')

use ({
    'dense-analysis/ale',
    config = function()
        vim.g.ale_lint_on_text_changed = 0
        vim.g.ale_lint_on_insert_leave = 0
        vim.g.ale_lint_on_filetype_changed = 0
        vim.g.ale_lint_on_enter = 0
        vim.g.ale_lint_on_save = 1

        vim.g.ale_hover_cursor = 0

        vim.g.ale_linters = {
            javascript = {'eslint', 'cspell'},
            javascriptreact = {'eslint', 'cspell'},
            typescript = {'eslint', 'tsserver', 'cspell'},
            typescriptreact = {'eslint', 'tsserver', 'cspell'}
        }
        vim.g.ale_fixers = {
            javascript = {'eslint'},
            javascriptreact = {'eslint'},
            typescript = {'eslint'},
            typescriptreact = {'eslint'}
        }

        vim.api.nvim_set_keymap('n', '<space>l', '<Plug>(ale_detail)', {silent = true})
        vim.api.nvim_set_keymap('n', '<space>L', '<Plug>(ale_lint)', {silent = true})
        vim.api.nvim_set_keymap('n', ']l', '<Plug>(ale_next)', {})
        vim.api.nvim_set_keymap('n', '[l', '<Plug>(ale_previous)', {})
    end
})
