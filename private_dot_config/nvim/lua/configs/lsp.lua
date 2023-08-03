require('common_fn')

vim.diagnostic.config({
  virtual_text = false
})

use({'williamboman/mason.nvim'})
use({'williamboman/mason-lspconfig.nvim'})
use({
  'neovim/nvim-lspconfig',
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {'tsserver', 'stylelint_lsp'}
    })

    local bufopts = {silent = true}
    vim.keymap.set('n', '<space>L', ':DiagWindowShow<CR>', bufopts)
    vim.keymap.set('n', '<space>ll', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<space>lq', vim.diagnostic.setqflist, bufopts)
    vim.keymap.set('n', '[l', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', ']l', vim.diagnostic.goto_next, bufopts)

    vim.keymap.set('n', '<space>h', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>H', vim.lsp.buf.signature_help, bufopts)

    vim.keymap.set('n', '<space>d', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<space>t', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>D', ':Lspsaga peek_definition<CR>', bufopts)
    vim.keymap.set('n', '<space>T', ':Lspsaga peek_type_definition<CR>', bufopts)

    vim.keymap.set('n', '<space>*', ':Lspsaga finder def+ref<CR>', bufopts)
    vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set({'n', 'v'}, '<space>a', vim.lsp.buf.code_action, bufopts)

    local lspconfig = require('lspconfig')
    lspconfig.tsserver.setup({})
    lspconfig.stylelint_lsp.setup({ -- https://github.com/bmatcuk/stylelint-lsp
      settings = {
        stylelintplus = {
          validateOnType = false,
          validateOnSave = true
        }
      }
    })
  end
})

use ({
  'nvimdev/lspsaga.nvim',
  config = function()
  require('lspsaga').setup({
    finder = {
      max_height = 0.9,
      left_width = 0.4,
      right_width = 0.6,
      layout = 'normal'
    },
    definition = {
      width = 1,
      height = 1
    },
    scroll_preview = {
      scroll_down = '<C-d>',
      scroll_up = '<C-u>',
    },
    symbol_in_winbar = {enable = false},
    lightbulb = {enable = false}
  })
  end,
})

use('hrsh7th/cmp-nvim-lsp'); -- LSP source for nvim-cmp
use('hrsh7th/cmp-nvim-lsp-signature-help');
use({
  'hrsh7th/nvim-cmp', -- Autocompletion plugin
  config = function()
    local cmp = require('cmp')
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-l>'] = cmp.mapping.complete(),
        ['<C-g>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true})
      }),
      sources = {
        {name = 'nvim_lsp'},
        {name = 'nvim_lsp_signature_help'},
        {name = 'buffer'}
      }
    })
  end
})

use({
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    local null_ls = require('null-ls')

    local sources = {
      null_ls.builtins.diagnostics.cspell.with({
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      }),
      null_ls.builtins.code_actions.cspell,

      null_ls.builtins.diagnostics.eslint_d.with({
        method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      }),
      null_ls.builtins.code_actions.eslint_d
    }

    null_ls.setup({sources = sources})
  end
})

use({
  'cseickel/diagnostic-window.nvim',
  requires = {'MunifTanjim/nui.nvim'}
})

use({
 'simrat39/symbols-outline.nvim',
  config = function ()
    require('symbols-outline').setup()
  end
})

use({
  'j-hui/fidget.nvim',
  tag = 'legacy',
  config = function()
    require('fidget').setup()
  end
})
