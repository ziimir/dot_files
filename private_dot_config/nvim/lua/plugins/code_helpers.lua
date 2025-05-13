-- find merge conflict markers
vim.api.nvim_set_keymap('n', '<leader>fc', '<ESC>/\\v^[<=>]{7}( .*|$)<CR>', {silent = true})

return {
    -- "tpope/vim-apathy",
    "tpope/vim-abolish",
    "scrooloose/nerdcommenter",
    "AaronLasseigne/yank-code",
    "AndrewRadev/linediff.vim",
    {
        "rareitems/hl_match_area.nvim",
        opts = { highlight_in_insert_mode = true },
        init = function()
            vim.api.nvim_set_hl(0, 'MatchArea', {bg = "#FFFFFF"})
        end,
    },
    {
        "m-demare/hlargs.nvim",
        opts = { color = "#9ACCCC" }
    },
    {
        "norcalli/nvim-colorizer.lua",
        opts = {
            css = { css_fn = true }
        }
    },
    {
        "mattn/vim-sonictemplate",
        init = function()
            vim.g.sonictemplate_vim_template_dir = { "~/.config/nvim/sonic_templates" }
        end
    },
    {
        "Wansmer/treesj", -- instead of AndrewRadev/splitjoin.vim
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            use_default_keymaps = false,
            check_syntax_error = false,
        },
        init = function()
            vim.keymap.set('n', 'gJ', require('treesj').join)
            vim.keymap.set('n', 'gS', require('treesj').split)
        end
    }
}
