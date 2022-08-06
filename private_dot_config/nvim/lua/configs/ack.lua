require('common_fn')

use({
    'mileszs/ack.vim',
    config = function()
        vim.g.ackprg = 'ag --vimgrep'
        vim.g.ack_qhandler = 'Trouble quickfix'

        cmd [[cnoreabbrev Ack Ack!]]

        vim.api.nvim_set_keymap('n', '<Leader>g', ':Ack<Space>', {})
        vim.api.nvim_set_keymap('n', '<Leader>G', ':Ack<Space>"\\b<cword>\\b"<CR>', {})
    end
})
