return {
    {
        "airblade/vim-gitgutter",
        init = function()
            vim.g.gitgutter_sign_added = "" -- f457
            vim.g.gitgutter_sign_modified = "" -- f459
            vim.g.gitgutter_sign_removed = "" -- f458
            vim.g.gitgutter_sign_removed_first_line = "" -- f458
            vim.g.gitgutter_sign_modified_removed = "" -- f459

            vim.keymap.set("n", "]h", "<Plug>(GitGutterNextHunk)", {})
            vim.keymap.set("n", "[h", "<Plug>(GitGutterPrevHunk)", {})
        end
    },
    {
        "tpope/vim-fugitive",
        init = function()
            vim.cmd [[autocmd BufReadPost fugitive://* set bufhidden=delete]]
            vim.cmd [[autocmd BufReadPost /^fugitive://* set bufhidden=delete]]
        end
    },
    "tpope/vim-rhubarb",
}
