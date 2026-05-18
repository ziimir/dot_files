return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-sensible",
    "djoshea/vim-autoread",
    "tpope/vim-repeat",
    "machakann/vim-sandwich",
    "svermeulen/vim-easyclip",
    "j-hui/fidget.nvim",
    {
        "LunarVim/bigfile.nvim",
        opts = {
            filesize = 100,
        },
    },
    {
        "kana/vim-textobj-line",
        dependencies = "kana/vim-textobj-user",
    },
    {
        "windwp/nvim-autopairs", -- instead of jiangmiao/auto-pairs.git or cohama/lexima.vim
        event = "InsertEnter",
        config = true
    },
    {
        "simeji/winresizer",
        init = function()
            vim.g.winresizer_start_key = '<leader>e'
        end
    },
    {
        "editorconfig/editorconfig-vim",
        init = function()
            vim.g.EditorConfig_exclude_patterns = { "fugitive://.*", "scp://.*" }
        end
    },
    {
        "machakann/vim-highlightedyank",
        init = function()
            vim.g.highlightedyank_highlight_duration = 300
            vim.cmd [[highlight HighlightedyankRegion guibg=#D2DFE7]]
        end
    },
    {
        "skywind3000/asyncrun.vim",
        init = function()
            vim.g.asyncrun_open = 19
        end
    },
    {
        "andymass/vim-matchup",
        init = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
            vim.g.matchup_matchparen_deferred = 1
        end
    },
    {
        "haya14busa/vim-asterisk",
        keys = {
            { "*",  "<Plug>(asterisk-z*)",  mode = "n" },
            { "#",  "<Plug>(asterisk-z#)",  mode = "n" },
            { "g*", "<Plug>(asterisk-gz*)", mode = "n" },
            { "g#", "<Plug>(asterisk-gz#)", mode = "n" },
        }
    },
    {
        "godlygeek/tabular",
        config = function()
            vim.cmd([[AddTabularPattern first_dash /^[^-]*\zs-/l1]])
        end
    },
    {
        "goolord/alpha-nvim",
        config = function()
            local dashboard = require("alpha.themes.dashboard")

            local date = os.date("📅 %Y-%m-%d")
            local time = os.date("⏰ %H:%M:%S")

            local version = vim.version()
            local nvim_version = string.format("🧪 Neovim v%d.%d.%d", version.major, version.minor, version.patch)

            dashboard.section.header.val = {
                date,
                time,
                nvim_version,
            }
            dashboard.section.buttons.val = {
                dashboard.button("e", "New file", ":ene<CR>"),
            }
            dashboard.section.footer.val = {}
            dashboard.opts.opts.noautocmd = true

            require("alpha").setup(dashboard.opts)
        end
    },
    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        event = "VeryLazy",
        opts = function()
            local view_settings = {
                border = { style = "single" },
                win_options = { winblend = 0 },
            }

            return {
                cmdline = { enabled = false },
                messages = { enabled = false },
                presets = {
                    long_message_to_split = true,
                    lsp_doc_border = true,
                },
                views = {
                    hover  = view_settings,
                    popup  = view_settings,
                    notify = view_settings,
                }
            }
        end
    },
}
