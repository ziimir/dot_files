require('common_fn')

-- tab navigation
vim.api.nvim_set_keymap('', '<C-l>', 'gt', {})
vim.api.nvim_set_keymap('', '<C-h>', 'gT', {})
vim.api.nvim_set_keymap('', '<C-k>', ':tabm +1<CR>', {})
vim.api.nvim_set_keymap('', '<C-j>', ':tabm -1<CR>', {})

use('easymotion/vim-easymotion')

use({
    'preservim/nerdtree',
    config = function()
        vim.g.NERDTreeQuitOnOpen = 1
        vim.g.NERDTreeShowHidden = 1
        vim.g.NERDTreeWinSize = 60
        vim.g.NERDTreeAutoDeleteBuffer = 1

        --vim.api.nvim_set_keymap('n', '<leader>t', ':NERDTreeToggle<CR>', {noremap = true})
        --vim.api.nvim_set_keymap('n', '<C-\\>', ':NERDTreeFind<CR>', {noremap = true})
    end
})

use({
    'mikavilpas/yazi.nvim',
    requires = 'akinsho/bufferline.nvim',
    config = function()
        local yazi = require('yazi')
        yazi.setup({})

        vim.api.nvim_set_keymap('n', '<leader>t', ':Yazi cwd<CR>', {noremap = true})
        vim.api.nvim_set_keymap('n', '<leader>-', ':Yazi<CR>', {noremap = true})
    end
})

use({
  'stevearc/oil.nvim',
  config = function()
    local oil = require('oil')
    oil.setup({
      keymaps = {
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-s>"] = false,
        ["<C-t>"] = {
          callback = function()
            oil.select({ tab = true, close = true })
          end,
          desc = "select_tab",
          mode = "n",
        },
        ["<C-p>"] = {
          callback = function()
            oil.open_preview({ vertical = true, split = 'belowright' })
          end,
          desc = "open_preview",
          mode = "n",
        },
      },
      view_options = {
        show_hidden = true
      }
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end
})
