require('common_fn')

-- find merge conflict markers
vim.api.nvim_set_keymap('n', '<leader>fc', '<ESC>/\\v^[<=>]{7}( .*|$)<CR>', {silent = true})

--use('tpope/vim-apathy')
use('tpope/vim-abolish')
use('scrooloose/nerdcommenter')
use('AaronLasseigne/yank-code')
use('AndrewRadev/linediff.vim')

use({
  'mattn/vim-sonictemplate',
  config = function()
    vim.g.sonictemplate_vim_template_dir = {'~/.config/nvim/sonic_templates'}
  end
})

use({
  'Wansmer/treesj', -- instead of AndrewRadev/splitjoin.vim
  config = function()
    local lang_utils = require('treesj.langs.utils')
    local join_split_opts = {
      split = {last_separator = false},
      join = {last_separator = false, space_in_brackets = false},
    }
    local js_lang_opts = {
      named_imports = lang_utils.set_preset_for_dict(join_split_opts),
      object = lang_utils.set_preset_for_dict(join_split_opts),
      array = lang_utils.set_preset_for_list(join_split_opts),
    }
    local ts_lang_opts = {
      named_imports = lang_utils.set_preset_for_dict(join_split_opts),
      object = lang_utils.set_preset_for_dict(join_split_opts),
      array = lang_utils.set_preset_for_list(join_split_opts),

      -- for ts only
      tuple_type = lang_utils.set_preset_for_dict(join_split_opts),
      enum_body = lang_utils.set_preset_for_dict(join_split_opts),
      type_parameters = lang_utils.set_preset_for_args({split = {last_separator = false}}),
      type_arguments = lang_utils.set_preset_for_args({split = {last_separator = false}}),
      object_type = lang_utils.set_preset_for_dict({
        both = {separator = ';', last_separator = true},
        join = {space_in_brackets = false}
      })
    }

    require('treesj').setup({
      use_default_keymaps = false,
      check_syntax_error = false,
      langs = {
        javascript = js_lang_opts,
        typescript = ts_lang_opts,
        tsx = ts_lang_opts
      }
    })

    vim.keymap.set('n', 'gJ', require('treesj').join)
    vim.keymap.set('n', 'gS', require('treesj').split)
  end
})

use ({
  'iamcco/markdown-preview.nvim',
  run = 'cd app && yarn install'
})

use ({
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      css = {css_fn = true}
    })
  end
})
