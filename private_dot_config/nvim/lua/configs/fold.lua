require('common_fn')

use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async',
    config = function()
        require('ufo').setup({
            provider_selector = function(_, _)
                    return {'treesitter', 'indent'}
            end,
            enable_get_fold_virt_text = true
        })

        vim.keymap.set('n', '<BS>', 'zc')
        vim.keymap.set('n', '<CR>', 'zo')

        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        vim.keymap.set('n', 'zr', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zm', require('ufo').closeAllFolds)
    end
}

vim.o.foldmethod = 'manual'
vim.o.foldlevel = 99
vim.o.foldlevelstart = -1
