vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        opts = {
            provider_selector = function(_, _)
                return { "treesitter", "indent" }
            end,
            enable_get_fold_virt_text = true,
        },
        init = function()
            vim.keymap.set("n", "<BS>", "zc")
            vim.keymap.set("n", "<CR>", "zo")

            vim.keymap.set("n", "zR", require("ufo").openAllFolds)
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            vim.keymap.set("n", "zr", require("ufo").openAllFolds)
            vim.keymap.set("n", "zm", require("ufo").closeAllFolds)
        end
    },
}
