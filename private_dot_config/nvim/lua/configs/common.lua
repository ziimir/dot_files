require('common_fn')

use('tpope/vim-sensible')
use('kana/vim-textobj-user')
use('kana/vim-textobj-line')
use('djoshea/vim-autoread')
use('tpope/vim-repeat')
use('machakann/vim-sandwich')
use('https://github.com/jiangmiao/auto-pairs.git')

--use('svermeulen/vim-easyclip')
use({
  'svermeulen/vim-cutlass',
  config = function()
    cmd [[
      nnoremap m d
      xnoremap m d

      nnoremap mm dd
      nnoremap M D

      nnoremap x d
      xnoremap x d

      nnoremap xx dd
      nnoremap X D
    ]]
  end
})

use({
  'simeji/winresizer',
  config = function()
    vim.g.winresizer_start_key = '<leader>e'
  end
})

use({
    'rhysd/clever-f.vim',
    config = function()
        vim.g.clever_f_across_no_line = 1
        vim.g.clever_f_smart_case = 1
    end
})

use({
    'editorconfig/editorconfig-vim',
    config = function()
        vim.g.EditorConfig_exclude_patterns = {'fugitive://.*', 'scp://.*'}
    end
})

use({
    'machakann/vim-highlightedyank',
    config = function()
        vim.g.highlightedyank_highlight_duration = 300
        cmd [[highlight HighlightedyankRegion guibg=#D2DFE7]]
    end
})

use({
    'skywind3000/asyncrun.vim',
    config = function()
        vim.g.asyncrun_open = 19
    end
})
