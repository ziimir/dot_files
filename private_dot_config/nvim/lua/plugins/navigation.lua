-- tab navigation
vim.api.nvim_set_keymap("", "<C-l>", "gt", {})
vim.api.nvim_set_keymap("", "<C-h>", "gT", {})
vim.api.nvim_set_keymap("", "<C-k>", ":tabm +1<CR>", {})
vim.api.nvim_set_keymap("", "<C-j>", ":tabm -1<CR>", {})

return {
    "easymotion/vim-easymotion",
    {
        "lewis6991/whatthejump.nvim",
        enabled = false,
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
        "mikavilpas/yazi.nvim",
        dependencies = "akinsho/bufferline.nvim",
        opts = {
            open_file_function = function (chosen_file)
                local function table_contains(tbl, x)
                    local found = false
                    for _, v in pairs(tbl) do
                        if v == x then
                            found = true
                        end
                    end
                    return found
                end

                local img_exts = { "png", "jpg", "jpeg", "gif" }
                local chosen_file_ext = vim.fn.fnamemodify(chosen_file, ":e");

                if (table_contains(img_exts, chosen_file_ext)) then
                    vim.ui.open(chosen_file)
                else
                    vim.cmd(string.format("edit %s", vim.fn.fnameescape(chosen_file)))
                end
            end
        },
        init = function()
            vim.api.nvim_set_keymap("n", "<leader>t", ":Yazi cwd<CR>", {noremap = true})
            vim.api.nvim_set_keymap("n", "<leader>-", ":Yazi<CR>", {noremap = true})
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
            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end
    }
}
