return{
    "vim-airline/vim-airline",
    dependencies = "vim-airline/vim-airline-themes",
    init = function()
        vim.g.airline_extensions = {"tabline", "quickfix", "fzf", "nvimlsp"}
        vim.g.airline_theme = "sol"

        vim.cmd [[
            if !exists("g:airline_symbols")
                let g:airline_symbols = {}
            endif
        ]]

        vim.g.airline_symbols.readonly = ""
        vim.g.airline_section_b = ""
        vim.g.airline_section_x = ""
        vim.g.airline_section_z = "%c:%l %p%%"
        vim.g["airline#parts#ffenc#skip_expected_string"] = "utf-8[unix]"

        vim.g["airline#extensions#nvimlsp#enabled"] = 1
        vim.g["airline#extensions#nvimlsp#error_symbol"] = " "
        vim.g["airline#extensions#nvimlsp#warning_symbol"] = " "
        vim.g["airline#extensions#nvimlsp#show_line_numbers"] = 0

        vim.g["airline#extensions#tabline#show_buffers"] = 0
        vim.g["airline#extensions#tabline#tabs_label"] = ""
        vim.g["airline#extensions#tabline#show_close_button"] = 0
        vim.g["airline#extensions#tabline#fnamemod"] = ":t"
        vim.g["airline#extensions#tabline#show_splits"] = 0
        vim.g["airline#extensions#tabline#show_tab_type"] = 0
        vim.g["airline#extensions#tabline#show_tab_nr"] = 0
  end
}
