-- tab navigation
vim.api.nvim_set_keymap("", "<C-l>", "gt", {})
vim.api.nvim_set_keymap("", "<C-h>", "gT", {})
vim.api.nvim_set_keymap("", "<C-k>", ":tabm +1<CR>", {})
vim.api.nvim_set_keymap("", "<C-j>", ":tabm -1<CR>", {})

return {
    {
        "smoka7/hop.nvim", -- instead of easymotion/vim-easymotion
        config = true,
        init = function()
            local hop = require('hop')
            local directions = require('hop.hint').HintDirection
            local position = require('hop.hint').HintPosition

            vim.keymap.set("", "f", function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end, { remap = true })
            vim.keymap.set("", "F", function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end, { remap = true })

            vim.keymap.set("", "t", function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end, { remap = true })
            vim.keymap.set("", "T", function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
            end, { remap = true })

            vim.keymap.set("", "<leader><leader>f", function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR })
            end, { remap = true })
            vim.keymap.set("", "<leader><leader>F", function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR })
            end, { remap = true })

            vim.keymap.set("", "<leader><leader>t", function()
                hop.hint_char1({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
            end, { remap = true })
            vim.keymap.set("", "<leader><leader>T", function()
                hop.hint_char1({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
            end, { remap = true })

            vim.keymap.set("", "<leader><leader>j", function()
                hop.hint_lines({ direction = directions.AFTER_CURSOR })
            end, { remap = true })
            vim.keymap.set("", "<leader><leader>k", function()
                hop.hint_lines({ direction = directions.BEFORE_CURSOR })
            end, { remap = true })

            vim.keymap.set("", "<leader><leader>w", function()
                hop.hint_words({ direction = directions.AFTER_CURSOR })
            end, { remap = true })
            vim.keymap.set("", "<leader><leader>b", function()
                hop.hint_words({ direction = directions.BEFORE_CURSOR })
            end, { remap = true })

            vim.keymap.set("", "<leader><leader>e", function()
                hop.hint_words({
                    direction = directions.AFTER_CURSOR,
                    hint_position = position.END,
                })
            end, { remap = true })
            vim.keymap.set("", "<leader><leader>ge", function()
                hop.hint_words({
                    direction = directions.BEFORE_CURSOR,
                    hint_position = position.END,
                })
            end, { remap = true })
        end
    },
    {
        "preservim/nerdtree",
        init = function()
            vim.g.NERDTreeQuitOnOpen = 1
            vim.g.NERDTreeShowHidden = 1
            vim.g.NERDTreeWinSize = 60
            vim.g.NERDTreeAutoDeleteBuffer = 1

            --vim.api.nvim_set_keymap("n", "<leader>t", ":NERDTreeToggle<CR>", {noremap = true})
            --vim.api.nvim_set_keymap("n", "<C-\\>", ":NERDTreeFind<CR>", {noremap = true})
        end
    },
    {
        "stevearc/oil.nvim",
        opts = {
            keymaps = {
                ["<C-h>"] = false,
                ["<C-l>"] = false,
                ["<C-s>"] = false,
                ["<C-t>"] = {
                    callback = function()
                        local oil = require('oil')
                        oil.select({ tab = true, close = true })
                    end,
                    desc = "select_tab",
                    mode = "n",
                },
                ["<C-p>"] = {
                    callback = function()
                        local oil = require('oil')
                        oil.open_preview({ vertical = true, split = "belowright" })
                    end,
                    desc = "open_preview",
                    mode = "n",
                },
            },
            view_options = { show_hidden = true },
        },
        init = function()
            vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Oil: open parent directory" })
            vim.keymap.set("n", "<leader>-", ":Oil .<CR>", { desc = "Oil: open project root" })
        end
    },
}
