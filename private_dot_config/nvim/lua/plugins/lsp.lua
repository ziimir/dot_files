return {
    "neovim/nvim-lspconfig",
    {
        "mason-org/mason.nvim",
        build = ":MasonUpdate",
        config = true,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mason-org/mason.nvim",
        },
        opts = {
            ensure_installed = {
                "ts_ls", "eslint",
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "cssls", "stylelint_lsp",
                "cspell_ls",
            },
        },
        init = function()
            local on_attach = function(_, bufnr)
                -- Go-to/Lists → quickfix
                local function qf_request(method, params, title)
                    params = params or vim.lsp.util.make_position_params(0)

                    vim.lsp.buf_request(0, method, params, function(err, result)
                        if err then
                            vim.notify(("LSP %s error: %s"):format(method, err.message), vim.log.levels.ERROR)
                            return
                        end

                        local items = (result and not vim.tbl_isempty(result)) and
                            vim.lsp.util.locations_to_items(result, 0) or {}
                        if #items == 0 then
                            return vim.notify("No results", vim.log.levels.INFO)
                        end
                        vim.fn.setqflist({}, " ", { title = title or method, items = items }); vim.cmd("copen")
                    end)
                end

                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
                end

                map("n", "<space>h", vim.lsp.buf.hover, "LSP: Hover")

                map("n", "<space>d", vim.lsp.buf.definition, "LSP: Definition")
                map("n", "<space>t", vim.lsp.buf.type_definition, "LSP: Type Definition")

                -- Открыть список определений (удобно выбрать и открыть в табе при желании)
                map("n", "<space>D", function() qf_request("textDocument/definition", nil, "Definitions") end,
                    "Defs → quickfix")
                map("n", "<space>T", function() qf_request("textDocument/typeDefinition", nil, "Type Definitions") end,
                    "TypeDefs → quickfix")
                map("n", "<space>i", function() qf_request("textDocument/implementation", nil, "Implementations") end,
                    "Impls → quickfix")
                map("n", "<space>*", function()
                    local p = vim.lsp.util.make_position_params(0); p.context = { includeDeclaration = true }
                    qf_request("textDocument/references", p, "References")
                end, "Refs → quickfix")

                -- Диагностики
                map("n", "[l", vim.diagnostic.goto_prev, "Prev diagnostic")
                map("n", "]l", vim.diagnostic.goto_next, "Next diagnostic")
                map("n", "<space>l", function()
                    vim.diagnostic.open_float(0, {
                        scope = "cursor",
                        focus = true,
                    })
                end, "Diagnostics float (cursor)")
                map("n", "<space>L", function()
                    vim.diagnostic.setqflist({ bufnr = 0, title = "Diagnostics (current buffer)" })
                    vim.cmd("copen")
                end, "Diagnostics (buffer) → loclist")

                -- Рефактор/экшены/формат
                map("n", "<space>r", vim.lsp.buf.rename, "Rename")
                map({ "n", "x", "v" }, "<space>R", vim.lsp.buf.code_action, "Code Actions")
            end

            -- возможности от blink.cmp (вместо cmp_nvim_lsp)
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config("lua_ls", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = { Lua = { diagnostics = { globals = { "vim" } } } },
            })

            vim.lsp.config("ts_ls", { on_attach = on_attach, capabilities = capabilities })

            vim.lsp.config("eslint", { on_attach = on_attach, capabilities = capabilities })

            vim.lsp.config("rust_analyzer", {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    ["rust-analyzer"] = { check = { command = "clippy" }, cargo = { allFeatures = true } },
                },
            })

            vim.lsp.config("clangd", { on_attach = on_attach, capabilities = capabilities })

            vim.lsp.config("cssls", { on_attach = on_attach, capabilities = capabilities })

            vim.lsp.config("stylelint_lsp", { on_attach = on_attach, capabilities = capabilities })

            local utils = require('utils')
            vim.lsp.config(
                "cspell_ls",
                {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    cmd = { "cspell-lsp", "--stdio", "--config", vim.fn.expand("~/.config/nvim/cspell.json") },
                    filetypes = utils.exclude_filetypes({
                        "oil",
                        "help",
                        "qf",
                        "alpha",
                    }),
                }
            )

            -- diagnostic
            vim.opt.signcolumn = "yes"
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.HINT]  = "",
                        [vim.diagnostic.severity.INFO]  = "",
                    },
                },
                float = { border = "rounded", source = "if_many" },
                severity_sort = true,
            })
        end,
    },
    {
        "ziimir/spelldicts",
        dev = true,
        lazy = false,
        build = ':SpellDictsUpdate', -- нужно потом в ручную запускать `:Lazy build spelldicts` или `:SpellDictsUpdate`
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            keymap     = {
                preset = "default",
                ['<C-l>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<C-space>'] = false,
                ['<Tab>'] = false,
                ['<S-Tab>'] = false,
            },
            appearance = { nerd_font_variant = "mono" },
            completion = {
                documentation = { auto_show = true },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true,
                    },
                },
            },
            signature  = { enabled = true },
            --sources    = { default = { "lsp", "path", "snippets", "buffer" } },
            sources    = { default = { "lsp", "path" } },
            snippets   = { preset = "luasnip" },
            fuzzy      = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
}
