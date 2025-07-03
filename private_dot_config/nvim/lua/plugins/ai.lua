return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            strategies = {
                chat = { adapter = "deepseek" },
                inline = { adapter = "deepseek" },
                cmd = { adapter = "deepseek" },
            },
            adapters = {
                openai = function()
                    return require("codecompanion.adapters").extend("deepseek", {
                        env = {
                            api_key = "cmd:cat ~/.deepseek_key | tr -d '\n'",
                        },
                    })
                end
            },
        },
    },
}
