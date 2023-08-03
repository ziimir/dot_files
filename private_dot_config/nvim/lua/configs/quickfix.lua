require('common_fn')

-- quickfix navigation
vim.api.nvim_set_keymap('n', ']q', ':cnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[q', ':cprevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', ']Q', ':clast<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '[Q', ':cfirst<CR>', {noremap = true, silent = true})

use({
  'yssl/QFEnter',
  config = function()
    vim.g.qfenter_exclude_filetypes = {'nerdtree'}
    vim.g.qfenter_keymap = {
      open = {'<CR>'},
      vopen = {'<C-v>'},
      hopen = {'<C-x>'},
      topen = {'<C-t>'}
    }
  end
})

use({'romainl/vim-qf'})

use({
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  config = function ()
    require('bqf').setup({
      preview = {
        winblend = 0,
        win_height = 999
      },
      func_map = {
          pscrollup = '<C-u>',
          pscrolldown = '<C-d>',
          prevfile = '<C-f>[',
          nextfile = '<C-f>]'
      }
    })

    local qfEnhancementGroup = vim.api.nvim_create_augroup('QfEnhancementGroup', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
        pattern = {'qf'},
        callback = function()
            vim.keymap.set('n', '<space>q', ':lua require("bqf").toggle()<CR>', { buffer = 0 })
            vim.keymap.set('n', '<C-p>', 'k', { buffer = 0 })
            vim.keymap.set('n', '<C-n>', 'j', { buffer = 0 })
        end,
        group = qfEnhancementGroup
    })
  end
})
