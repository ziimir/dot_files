require('common_fn')

--use('osyo-manga/vim-anzu')

use('tpope/vim-sensible')
use('kana/vim-textobj-user')
use('kana/vim-textobj-line')
use('svermeulen/vim-easyclip')
use('TaDaa/vimade')
use('djoshea/vim-autoread')
use('tpope/vim-repeat')
use('simeji/winresizer')
use('machakann/vim-sandwich')
use('https://github.com/jiangmiao/auto-pairs.git')

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

use({
    'yssl/QFEnter',
    config = function()
        vim.g.qfenter_keymap = {
            open = {'<CR>'},
            vopen = {'<C-v>'},
            hopen = {'<C-x>'},
            topen = {'<C-t>'}
        }
    end
})
