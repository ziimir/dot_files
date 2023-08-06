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
  --'~/work/root-climber.nvim',
  'ziimir/root-climber.nvim',
  config = function()
    vim.g["root_climber#always_confirm"] = 0

    vim.api.nvim_create_user_command(
      "TestRootClimber",
      function(args_table)
        require("root-climber").run(
          args_table.args,
          function(checked)
            if checked == nil then
              print("nothing")
            else
              print(checked)
            end
          end
        )
      end,
      {nargs = 1}
    )

    vim.api.nvim_create_user_command(
      "FzfTestRootClimber",
      function(args_table)
        require("root-climber").fzf_run(
          args_table.args,
          function(checked)
            if checked == nil then
              print("nothing")
            else
              print(checked)
            end
          end
        )
      end,
      {nargs = 1}
    )
  end
})

use({
  'vim-test/vim-test',
  config = function()
    vim.g['test#strategy'] = "floaterm"
    vim.g['test#javascript#mocha#file_pattern'] = '\\v(tests?/.*|(test))\\.(js|jsx|ts|tsx)$'
    vim.g['test#javascript#jest#file_pattern'] = '\\v(__tests__/.*|(spec|test))\\.(js|jsx|ts|tsx)$'
    vim.g['test#javascript#karma#file_pattern'] = '\\v(test|spec)\\.(js|jsx|ts|tsx)$'
    vim.g['test#javascript#jasmine#file_pattern'] = '\\v^spec/.*spec\\.(js|jsx|ts|tsx)$'

    vim.api.nvim_create_user_command(
      "Jest",
      function()
        require("root-climber").fzf_run(
          "*.jest.config.js",
          function(path)
            vim.api.nvim_command("TestFile --config " .. path)
          end
        )
      end,
      {nargs = 0}
    )
  end
})

use({
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 0
    vim.g.splitjoin_curly_brace_padding = 0
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
