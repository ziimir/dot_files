return {
    "mileszs/ack.vim",
    init = function()
        local utils = require('utils')

        --vim.g.ackprg = "ag --vimgrep"
        --local ag_file_globs = {
        --"-G .*\\.tsx",
        --"-G .*\\.test\\.tsx",
        --"-G .*\\.story\\.tsx",
        --}
        vim.g.ackprg = "rg --vimgrep --hidden --follow --glob \"!.git\" --glob \"!.obsidian\""
        local rg_file_globs = {
            "--glob \"*\\.tsx\"",
            "--glob \"*\\.test\\.tsx\"",
            "--glob \"*\\.story\\.tsx\"",
        }

        vim.cmd [[cnoreabbrev Ack Ack!]]
        vim.cmd [[cnoreabbrev AckAdd AckAdd!]]
        vim.cmd [[cnoreabbrev LAck LAck!]]
        vim.cmd [[cnoreabbrev LAckAdd LAckAdd!]]

        vim.api.nvim_set_keymap("n", "<Leader>g", ":Ack<Space>", {})
        vim.api.nvim_set_keymap("n", "<Leader>G", ":Ack<Space>\"\\b<cword>\\b\"<CR>", { desc = "Ack: find word" })

        vim.keymap.set(
            "v",
            "<Leader>G",
            function()
                -- выходим из визуального режима
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
                    "nx",
                    false
                )

                -- ждём, пока Nvim обновит маркеры `'<` и `'>`, затем читаем выделение
                vim.schedule(function()
                    local text = require('utils').get_visual_selection()

                    local cmd = "Ack! " .. vim.fn.shellescape(utils.escape_for_regex(text))
                    vim.fn.feedkeys(":" .. cmd, "n")
                end)
            end,
            { desc = "Ack: find selection" }
        )
        vim.keymap.set(
            "n",
            "<Leader>af",
            function()
                local filename = vim.fn.expand("%:t:r")
                local pattern = string.format([[\b%s\b]], filename)

                local cmd = "Ack! " .. vim.fn.shellescape(pattern)
                vim.fn.feedkeys(":" .. cmd, "n")
            end,
            { desc = "Ack: find filename" }
        )
        vim.keymap.set(
            "n",
            "<Leader>ap",
            function()
                local filename = vim.fn.expand("%:r")
                local pattern = string.format([[\b%s\b]], filename)

                local cmd = "Ack! " .. vim.fn.shellescape(pattern)
                vim.fn.feedkeys(":" .. cmd, "n")
            end,
            { desc = "Ack: find file path" }
        )
        vim.keymap.set(
            'n',
            '<Leader>ag',
            function()
                return vim.fn['fzf#run'](
                    {
                        source = rg_file_globs,
                        sink = function(line)
                            local cmd = "Ack! " .. line
                            vim.fn.feedkeys(":" .. cmd .. " ", "n")
                        end
                    }
                )
            end,
            { noremap = true }
        )
    end
}
