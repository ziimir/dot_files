return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-sensible",
    "djoshea/vim-autoread",
    "tpope/vim-repeat",
    "machakann/vim-sandwich",
    "svermeulen/vim-easyclip",
    {
        "kana/vim-textobj-line",
        dependencies = "kana/vim-textobj-user",
    },
    {
        url = "https://github.com/jiangmiao/auto-pairs.git", -- or cohama/lexima.vim
        enabled = flase,
    },
    {
        "windwp/nvim-autopairs",
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
        "rhysd/clever-f.vim",
        init = function()
            vim.g.clever_f_across_no_line = 1
            vim.g.clever_f_smart_case = 1
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
            vim.g.matchup_matchparen_offscreen = {}
            vim.g.matchup_matchparen_deferred = 1
        end
    },
}
