require('common_fn')

use({
    'neoclide/coc.nvim',
    branch = 'release',
    config = function()
        vim.g.coc_global_extensions = {'coc-tsserver', 'coc-spell-checker', 'coc-sumneko-lua'}

        local bufopts = {silent = true}
        vim.keymap.set('n', '<space>h', ':call CocAction(\'doHover\')<CR>', bufopts)
        vim.keymap.set('n', '<space>d', ':call CocAction(\'jumpDefinition\', \'edit\')<CR>', bufopts)
        vim.keymap.set('n', '<space>D', ':call CocAction(\'jumpDefinition\', \'tab drop\')<CR>', bufopts)
        vim.keymap.set('n', '<space>t', ':call CocAction(\'jumpTypeDefinition\', \'edit\')<CR>', bufopts)
        vim.keymap.set('n', '<space>T', ':call CocAction(\'jumpTypeDefinition\', \'tab drop\')<CR>', bufopts)
        vim.keymap.set('n', '<space>*', '<Plug>(coc-references)', bufopts)
        vim.keymap.set('n', '<space>r', '<Plug>(coc-rename)', bufopts)

        vim.keymap.set('n', '<space>A', '<Plug>(coc-codeaction)', bufopts)
        vim.keymap.set('n', '<space>a', '<Plug>(coc-codeaction-line)', bufopts)

        vim.keymap.set('i', '<c-l>', 'coc#refresh()', {silent = true, noremap = true, expr = true})

        -- disable omnicompletion status messages (e.g. Pattern not found) https://stackoverflow.com/questions/14716756/vim-disable-omnicompletion-status-messages-e-g-pattern-not-found
        cmd [[setlocal shortmess+=c]]

        --inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
        --inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
    end
})

use('antoinemadec/coc-fzf')
