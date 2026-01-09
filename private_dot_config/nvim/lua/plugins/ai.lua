return {
    --{
    --"ravitemer/mcphub.nvim",
    --enabled = false,
    --dependencies = {
    --"nvim-lua/plenary.nvim",
    --},
    --build = "npm install -g mcp-hub@latest",
    --config = function()
    --require("mcphub").setup()
    --end
    --},
    {
        "olimorris/codecompanion.nvim",
        enabled = true,
        version = "^18.0.0",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            opts = {
                language = "Russian",
            },
            adapters = {
                http = {
                    openai = function()
                        return require("codecompanion.adapters").extend("openai", {
                            env = {
                                api_key = "cmd:cat ~/.gpt_key | tr -d '\n'",
                            },
                        })
                    end,
                    vllm = function()
                        return require("codecompanion.adapters").extend("openai", {
                            url = "http://192.168.0.253:8000/v1/chat/completions",
                            env = {
                                api_key = "localtoken",
                            },
                            schema = {
                                model = {
                                    default = "Qwen/Qwen2.5-Coder-7B-Instruct-AWQ",
                                },
                            },
                        })
                    end,
                }
            },
            interactions = {
                chat = { adapter = "openai" },
                inline = { adapter = "vllm" },
                cmd = { adapter = "vllm" },
                background = { adapter = "vllm" }
            },
        },
        init = function()
            vim.keymap.set('n', '<space>aa', ':CodeCompanionChat<CR>')
            vim.keymap.set('n', '<space>ai', ':CodeCompanion ')
        end
    },
}
