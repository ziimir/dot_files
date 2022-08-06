require('common_fn')

use({
    'airblade/vim-gitgutter',
    config = function()
        vim.g.gitgutter_sign_added = "" -- f457
        vim.g.gitgutter_sign_modified = "" -- f459
        vim.g.gitgutter_sign_removed = "" -- f458
        vim.g.gitgutter_sign_removed_first_line = "" -- f458
        vim.g.gitgutter_sign_modified_removed = "" -- f459

        vim.opt.updatetime = 100

        vim.keymap.set('n', ']h', '<Plug>(GitGutterNextHunk)', {})
        vim.keymap.set('n', '[h', '<Plug>(GitGutterPrevHunk)', {})
    end
})

use({
    'tpope/vim-fugitive',
    config = function()
        cmd [[autocmd BufReadPost fugitive://* set bufhidden=delete]]
        cmd [[autocmd BufReadPost /^fugitive://* set bufhidden=delete]]
    end
})

use('tpope/vim-rhubarb')
