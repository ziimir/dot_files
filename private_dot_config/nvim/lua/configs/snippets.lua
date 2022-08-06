require('common_fn')

use('mattn/emmet-vim')

use({
    'L3MON4D3/LuaSnip',
    config = function()
        local ls = require('luasnip')

        vim.keymap.set(
            'i',
            '<Tab>',
            function()
                if ls.expandable() then
                    vim.api.nvim_input('<Plug>luasnip-expand-snippet')
                else
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
                end
            end,
            {silent = true}
        )

        vim.keymap.set(
            'i',
            '<C-j>',
            function()
                if ls.jumpable(1) then
                    ls.jump(1)
                end
            end,
            {silent = true}
        )

        vim.keymap.set(
            'i',
            '<C-k>',
            function()
                if ls.jumpable(-1) then
                    ls.jump(-1)
                end
            end,
            {silent = true}
        )
    end
})
