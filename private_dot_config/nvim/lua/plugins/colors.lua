return {
    --"junegunn/seoul256.vim",
    {
        "mcchrish/zenbones.nvim",
        dependencies = "rktjmp/lush.nvim",
        init = function()
            vim.cmd [[set background=light]]
            vim.cmd [[colorscheme zenbones]]
            --vim.cmd [[colorscheme seoulbones]]
            --vim.cmd [[colorscheme seoul256-light]]
        end
    }
}
