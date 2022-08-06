require('common_fn')

cmd [[autocmd BufRead,BufNewFile *.css set filetype=scss.css]]

use('nvim-treesitter/nvim-treesitter-textobjects')
use('windwp/nvim-ts-autotag')

use('neovimhaskell/haskell-vim')

use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {'typescript', 'tsx', 'javascript', 'css', 'scss'},
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
            incremental_selection = {
                enable = false
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ip'] = '@parameter.inner'
                    }
                }
            },
            autotag = {
                enable = true
            }
        }
    end
})
