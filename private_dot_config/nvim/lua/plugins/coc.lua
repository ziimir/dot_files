return {
    {
        -- mason for installing prettier
        "williamboman/mason.nvim",
        config = true,
    },
    {
        -- install after
        -- coc-tsserver, coc-eslint
        -- coc-spell-checker, coc-cspell-dicts
        -- coc-cssmodules, coc-stylelint
        -- coc-clangd
        -- coc-rust-analyzer
        "neoclide/coc.nvim",
        branch = "release",
        init = function()
            -- Always show the signcolumn, otherwise it would shift the text each time diagnostics appeared/became resolved
            vim.opt.signcolumn = "yes"

            local keyset = vim.keymap.set
            local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }

            -- Use <c-space> to trigger completion
            keyset("i", "<c-l>", "coc#refresh()", { silent = true, expr = true })

            -- Use `[l` and `]l` to navigate diagnostics
            -- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
            keyset("n", "[l", "<Plug>(coc-diagnostic-prev)", { silent = true })
            keyset("n", "]l", "<Plug>(coc-diagnostic-next)", { silent = true })

            -- GoTo code navigation
            keyset("n", "<space>h", "<space>h :call CocAction('doHover')<CR>", { silent = true })
            keyset("n", "<space>d", "<Plug>(coc-definition)", { silent = true })
            keyset("n", "<space>D", ":call CocAction('jumpDefinition', 'tab drop')<CR>", { silent = true })
            keyset("n", "<space>t", "<Plug>(coc-type-definition)", { silent = true })
            keyset("n", "<space>T", ":call CocAction('jumpTypeDefinition', 'tab drop')", { silent = true })
            keyset("n", "<space>i", "<Plug>(coc-implementation)", { silent = true })
            keyset("n", "<space>*", "<Plug>(coc-references)", { silent = true })
            keyset("n", "<space>l", "<Plug>(coc-diagnostic-info)", { silent = true })

            keyset("n", "<space>r", "<Plug>(coc-rename)", { silent = true })
            keyset("n", "<space>R", "<Plug>(coc-refactor)", { silent = true })

            -- code action
            keyset("n", "<space>ac", "<Plug>(coc-codeaction-cursor)", { silent = true })
            keyset("n", "<space>al", "<Plug>(coc-codeaction-line)", { silent = true })
            keyset("n", "<space>af", "<Plug>(coc-codeaction)", { silent = true })
            keyset("n", "<space>as", "<Plug>(coc-codeaction-source)", { silent = true })
            keyset("v", "<space>av", "<Plug>(coc-codeaction-selected)", { silent = true })
            keyset("v", "<space>ar", "<Plug>(coc-codeaction-refactor)", { silent = true })

            -- Formatting selected code
            keyset("x", "<space>f", "<Plug>(coc-format-selected)", { silent = true })
            keyset("n", "<space>f", "<Plug>(coc-format-selected)", { silent = true })

            -- Remap <C-f> and <C-b> to scroll float windows/popups
            ---@diagnostic disable-next-line: redefined-local
            local opts = { silent = true, nowait = true, expr = true }
            keyset("n", "<C-e>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-e>"', opts)
            keyset("n", "<C-y>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-y>"', opts)
            keyset("i", "<C-e>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
            keyset("i", "<C-y>", 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
            keyset("v", "<C-e>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-e>"', opts)
            keyset("v", "<C-y>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-y>"', opts)

            -- Add `:Format` command to format current buffer
            vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

            -- Mappings for CoCList
            -- code actions and coc stuff
            ---@diagnostic disable-next-line: redefined-local
            local opts = { silent = true, nowait = true }
            -- Manage extensions
            keyset("n", "<leader><space>e", ":<C-u>CocList extensions<cr>", opts)
            -- Show commands
            keyset("n", "<leader><space>c", ":<C-u>CocList commands<cr>", opts)
            -- Find symbol of current document
            keyset("n", "<leader><space>o", ":<C-u>CocList outline<cr>", opts)
            -- Search workspace symbols
            keyset("n", "<leader><space>s", ":<C-u>CocList -I symbols<cr>", opts)
            -- Resume latest coc list
            keyset("n", "<leader><space>p", ":<C-u>CocListResume<cr>", opts)
        end
    }
}
