return {
    "mileszs/ack.vim",
    init = function()
        vim.g.ackprg = "ag --vimgrep"

        vim.cmd [[cnoreabbrev Ack Ack!]]
        vim.cmd [[cnoreabbrev AckAdd AckAdd!]]
        vim.cmd [[cnoreabbrev LAck LAck!]]
        vim.cmd [[cnoreabbrev LAckAdd LAckAdd!]]

        vim.api.nvim_set_keymap("n", "<Leader>g", ":Ack<Space>", {})
        vim.api.nvim_set_keymap("n", "<Leader>G", ":Ack<Space>\"\\b<cword>\\b\"<CR>", {})

        vim.keymap.set(
            "n",
            "<Leader>af",
            function()
                local filename = vim.fn.expand("%:t:r")
                local pattern = string.format([[\b%s\b]], filename)

                local cmd = "Ack! " .. vim.fn.shellescape(pattern)
                vim.fn.feedkeys(":" .. cmd, "n")
            end
        )
       vim.keymap.set(
            "n",
            "<Leader>ap",
            function()
                local filename = vim.fn.expand("%:r")
                local pattern = string.format([[\b%s\b]], filename)

                local cmd = "Ack! " .. vim.fn.shellescape(pattern)
                vim.fn.feedkeys(":" .. cmd, "n")
            end
        )
        vim.keymap.set(
             "n",
             "<Leader>ag",
             function()
                 local cmd = "Ack! " .. "-G .*\\.tsx"
                 vim.fn.feedkeys(":" .. cmd, "n")
             end
        )
    end
}
