vim.cmd [[autocmd BufRead,BufNewFile *.css set filetype=scss]]

return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "typescript",
                    "tsx",
                    "javascript",
                    "css",
                    "scss",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "c",
                    "cpp",
                    "rust",
                },
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = { enable = false },
                autotag = { enable = true }
            })
        end
    },
    {
        "sbdchd/neoformat",
        config = function()
            vim.g.neoformat_try_node_exe = 1
            vim.g.neoformat_only_msg_on_error = 1

            vim.cmd [[autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css Neoformat]]
            vim.cmd [[autocmd BufWritePre *.rs Neoformat]]
        end
    }
}
