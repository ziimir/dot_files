require('common_fn')

use({
    'vim-airline/vim-airline',
    requires = 'vim-airline/vim-airline-themes',
    config = function()
        vim.g.airline_extensions = {'tabline', 'quickfix', 'fzf', 'ale'}
        vim.g.airline_theme = 'sol'

        cmd [[
            if !exists('g:airline_symbols')
                let g:airline_symbols = {}
            endif
        ]]

        vim.g.airline_symbols.readonly = ''
        vim.g.airline_section_x = ''
        vim.g.airline_section_z = '%c:%l %p%%'
        vim.g['airline#parts#ffenc#skip_expected_string'] = 'utf-8[unix]'

        vim.g['airline#extensions#ale#show_line_numbers'] = 0
        vim.g['airline#extensions#ale#error_symbol'] = ' '
        vim.g['airline#extensions#ale#warning_symbol'] = ' '

        vim.g['airline#extensions#tabline#show_buffers'] = 0
        vim.g['airline#extensions#tabline#tabs_label'] = ''
        vim.g['airline#extensions#tabline#show_close_button'] = 0
        vim.g['airline#extensions#tabline#fnamemod'] = ':t'
        vim.g['airline#extensions#tabline#show_splits'] = 0
        vim.g['airline#extensions#tabline#show_tab_type'] = 0
        vim.g['airline#extensions#tabline#show_tab_nr'] = 0
  end
})
