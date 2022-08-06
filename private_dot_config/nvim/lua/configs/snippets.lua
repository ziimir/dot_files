require('common_fn')

use('mattn/emmet-vim')
use({
    'SirVer/ultisnips',
    config = function()
        vim.g.UltiSnipsExpandTrigger = '<tab>'
        vim.g.UltiSnipsJumpForwardTrigger = '<c-j>'
        vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'
        vim.g.UltiSnipsSnippetDirectories = {'~/.snippets'}
    end
})
