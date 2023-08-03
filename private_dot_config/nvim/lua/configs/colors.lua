require('common_fn')

--use('junegunn/seoul256.vim')

use({
    'mcchrish/zenbones.nvim',
    requires = 'rktjmp/lush.nvim',
    config = function()
        cmd [[set background=light]]
        cmd [[colorscheme zenbones]]
        --cmd [[colorscheme seoulbones]]
        --cmd [[colorscheme seoul256-light]]
    end
})
