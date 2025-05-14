return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-sensible",
    "djoshea/vim-autoread",
    "tpope/vim-repeat",
    "machakann/vim-sandwich",
    "svermeulen/vim-easyclip",
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
            vim.g.EditorConfig_exclude_patterns = {"fugitive://.*", "scp://.*"}
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
            { "*", "<Plug>(asterisk-z*)", mode = "n" },
            { "#", "<Plug>(asterisk-z#)", mode = "n" },
            { "g*", "<Plug>(asterisk-gz*)", mode = "n" },
            { "g#", "<Plug>(asterisk-gz#)", mode = "n" },
        }
    },
}
