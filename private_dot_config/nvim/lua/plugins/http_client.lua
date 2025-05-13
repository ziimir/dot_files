return {
    "diepm/vim-rest-console",
    init = function ()
        -- for help file - :h vrc
        vim.g.vrc_curl_opts = {
            ["--silent"] = "",
            ["--include"] = "",
        }
        vim.g.vrc_include_response_header = 1
    end
}
