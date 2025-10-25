-- find merge conflict markers
vim.api.nvim_set_keymap('n', '<leader>fc', '<ESC>/\\v^[<=>]{7}( .*|$)<CR>', { silent = true })

return {
    -- "tpope/vim-apathy",
    "tpope/vim-abolish",
    "scrooloose/nerdcommenter",
    "AndrewRadev/linediff.vim",
    {
        "AaronLasseigne/yank-code.nvim",
        opts = {},
        init = function()
            vim.api.nvim_create_user_command("YankACode", function(opts)
                -- проброс диапазона в YankCode
                if opts.range > 0 then
                    vim.cmd(("%d,%dYankCode"):format(opts.line1, opts.line2))
                else
                    vim.cmd("YankCode")
                end

                local reg = vim.fn.getreg("+")
                local wrapped = "```\n" .. reg .. "```\n"
                vim.fn.setreg("+", wrapped)
            end, { range = true })
        end,
    },
    {
        "rareitems/hl_match_area.nvim",
        opts = { matchpairs = { "(:)", "{:}", "[:]", "<:>" } },
        init = function()
            vim.api.nvim_set_hl(0, 'MatchArea', { bg = "#FFFFFF" })
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
    },
    {
        "echasnovski/mini.indentscope",
        version = "*",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            draw = { delay = 0 },
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "markdown", "alpha" },
                callback = function() vim.b.miniindentscope_disable = true end,
            })
        end,
    }
}
