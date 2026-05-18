return {
    "diepm/vim-rest-console",
    init = function()
        -- for help file - :h vrc
        vim.g.vrc_curl_opts = {
            ["--silent"] = "",
            ["--include"] = "",
        }
        vim.g.vrc_include_response_header = 1
        vim.g.vrc_response_default_content_type = "application/json"

        vim.g.vrc_auto_format_response_patterns = {
            json = "jq .",
        }

        vim.api.nvim_create_user_command(
            "SetRestFT",
            function()
                vim.cmd("set ft=rest")
            end,
            { nargs = 0 }
        )
    end
}
