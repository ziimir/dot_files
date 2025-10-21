vim.cmd [[autocmd BufRead,BufNewFile *.css set filetype=scss]]

return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        priority = 49,
        config = function()
            local presets = require("markview.presets");
            require("markview").setup({
                markdown = {
                    headings = presets.headings.glow,
                    tables = presets.single,
                }
            });

            vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
                pattern = "*.md",
                callback = function(ev)
                    if ev.event == "InsertEnter" then
                        vim.cmd("Markview disable")
                    else
                        vim.cmd("Markview enable")
                    end
                end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    vim.keymap.set(
                        "n",
                        "<leader>pp",
                        "<cmd>Markview toggle<CR>",
                        { buffer = true, desc = "Toggle Markview preview" }
                    )
                end,
            })
        end
    },
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
                    "yaml",
                    "c",
                    "cpp",
                    "rust",
                },
                highlight = { enable = true },
                indent = { enable = true },
                incremental_selection = { enable = false },
                autotag = { enable = true },
                matchup = { enable = false },
            })
        end
    },
    {
        "sbdchd/neoformat",
        enabled = false,
        config = function()
            vim.g.neoformat_try_node_exe = 1
            vim.g.neoformat_only_msg_on_error = 1

            vim.cmd [[autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css Neoformat]]
            vim.cmd [[autocmd BufWritePre *.rs Neoformat]]
        end
    },
    {
        "stevearc/conform.nvim",
        opts = {
            -- filetypes list:
            -- :echo getcompletion('', 'filetype')
            -- list to filetypes starting with a 'c':
            -- :echo getcompletion('c', 'filetype')
            formatters_by_ft = {
                -- lua = { "stylua" },

                json = { "prettier" },

                javascript = { "prettier" },
                javascriptreact = { "prettier" },
                typescript = { "prettier" },
                typescriptreact = { "prettier" },

                html = { "djlint" },
                htmldjango = { "djlint" },

                css = { "prettier" },
                scss = { "prettier" },

                rust = { "rustfmt" },

                --markdown = { "prettier" },
            },
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 10000,
            }
        },
    },
}
