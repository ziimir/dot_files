require('common_fn')

vim.diagnostic.config({
    virtual_text = false
})

use({
    'williamboman/nvim-lsp-installer',
    config = function()
        require('nvim-lsp-installer').setup({
            ensure_installed = {'tsserver', 'hls'}
        })
    end
})

use({
    'neovim/nvim-lspconfig',
    config = function()
        local bufopts = {silent = true}
        vim.keymap.set('n', '<space>l', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<space>L', ':Trouble document_diagnostics<CR>', opts)
        vim.keymap.set('n', '[l', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']l', vim.diagnostic.goto_next, opts)

        vim.keymap.set('n', '<space>h', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<space>H', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>d', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', '<space>t', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>*', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)

        vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, bufopts)

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

        require('lspconfig').tsserver.setup({
            capabilities = capabilities,
            handlers = {
                ["textDocument/references"] = function(err, method, params, client_id, ...)
                    vim.lsp.handlers["textDocument/references"](err, method, params, client_id, ...)
                end
            }
        })
        require('lspconfig').hls.setup({capabilities = capabilities})
    end
})

use('hrsh7th/cmp-nvim-lsp'); -- LSP source for nvim-cmp
use('hrsh7th/cmp-nvim-lsp-signature-help');

use({
    'hrsh7th/nvim-cmp', -- Autocompletion plugin
    config = function()
        local cmp = require('cmp')
        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            mapping = cmp.mapping.preset.insert({
                  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-d>'] = cmp.mapping.scroll_docs(4),
                  ['<C-l>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({select = true})
            }),
            sources = {
                {name = 'nvim_lsp'},
                {name = 'buffer'},
                {name = 'nvim_lsp_signature_help'}
            }
        })
    end
})

use({
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            javascript = {'eslint'},
            javascriptreact = {'eslint'},
            typescript = {'eslint'},
            typescriptreact = {'eslint'},
        }
        vim.api.nvim_create_autocmd({'BufWritePost'}, {
            callback = function()
                require('lint').try_lint()
            end
        })
    end
})
