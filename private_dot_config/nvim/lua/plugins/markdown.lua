return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            enabled = false,
            anti_conceal = { enabled = false },
            heading = { atx = false, position = 'inline' }
        }
    },
    {
        "obsidian-nvim/obsidian.nvim",
        dependencies = {
            {
                "folke/snacks.nvim",
                opts = { picker = {}, explorer = {} },
            },
        },
        version = "*",
        ft = "markdown",
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
            -- refer to `:h file-pattern` for more examples
            "BufReadPre " .. vim.fn.expand "~" .. "/Documents/obsidian/*.md"
        },
        opts = {
            frontmatter = { enabled = false },
            ui = { enable = false }, -- чтобы разметку рендерил только render-markdown.nvim
            legacy_commands = false,
            workspaces = {
                {
                    name = "english",
                    path = "~/Documents/obsidian/english",
                },
                {
                    name = "english-2",
                    path = "~/Documents/obsidian/english-2",
                },
            },
            completion = {
                nvim_cmp = false,
                blink = true,
                min_chars = 0,
            },
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "ObsidianNoteEnter",
                callback = function(ev)
                    vim.keymap.del("n", "<CR>", { buffer = ev.buf })
                end,
            })
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("MyLspOnAttach", { clear = true }),
                callback = function(args)
                    local bufnr = args.buf
                    local function map(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
                    end

                    map("n", "<space>d", ":Obsidian follow_link<CR>", "Obs: Follow link")
                    map("n", "<space>D", function()
                        vim.cmd("Obsidian follow_link vsplit")
                        vim.schedule(function() vim.cmd("wincmd T") end)
                    end, "Obs: open link in new tab")
                end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "markdown",
                callback = function()
                    vim.keymap.set(
                        "n",
                        "<leader>pp",
                        function()
                            local path = vim.fn.shellescape(vim.fn.expand('%:p'))
                            local cmd = ([[glow -p %s]]):format(path)

                            vim.cmd("FloatermNew --autoclose=1 " .. cmd)
                        end,
                        { buffer = true, desc = "Toggle glow preview" }
                    )
                end,
            })
        end
    },
    {
        'SCJangra/table-nvim',
        ft = 'markdown',
        opts = {},
    },
    {
        "ziimir/limelight-section",
        dependencies = { "junegunn/limelight.vim" },
        name = "limelight-section",
        ft = { "markdown" },
        dev = true,
        config = function()
            local limelight_section = require("limelight-section")
            limelight_section.setup({
                filetypes = { "markdown" },
                throttle_ms = 50,
            })

            vim.keymap.set("n", "<leader>zz", limelight_section.toggle, { desc = "Limelight: toggle section mode" })
        end
    },
    {
        "ziimir/mdoutline",
        name = "mdoutline",
        ft = { "markdown" },
        dev = true,
        lazy = true,
        opts = {}
    },
    {
        "ziimir/wikipeek",
        dependencies = { "obsidian-nvim/obsidian.nvim", "MeanderingProgrammer/render-markdown.nvim" },
        dev = true,
        ft = { "markdown" },
        event = { "BufReadPre *.md" },
        opts = {
            filetypes = { "markdown" },
            extra_roots = {},
        },
        init = function()
            local function set_wikipeek_keymaps(buf)
                -- снесём чужие мапы на этот буфер
                pcall(vim.keymap.del, "n", "<space>h", { buffer = buf })

                -- наш мап: всегда вызывать wikipeek (без LSP)
                local opts = {
                    buffer = buf,
                    noremap = true,
                    nowait = true,
                    silent = true,
                    desc = "Wikipeek: popup preview"
                }
                vim.keymap.set("n", "<space>h", ":WikilinkPeek<CR>", opts)
                vim.keymap.set("n", "<space>D", function()
                    vim.cmd("Obsidian follow_link vsplit")
                    vim.schedule(function() vim.cmd("wincmd T") end)
                end, opts)
            end

            -- Ставим ключ при входе в markdown-буфер (поздно, чтобы «перебить» других)
            vim.api.nvim_create_autocmd("FileType", {
                group = vim.api.nvim_create_augroup("WikipeekKeys", { clear = true }),
                pattern = "markdown",
                callback = function(ev)
                    vim.schedule(function() set_wikipeek_keymaps(ev.buf) end)
                end,
            })

            -- На случай, если LSP/плагин перезапишет позже — переутверждаем
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("WikipeekKeysReassert", { clear = true }),
                callback = function(ev)
                    if vim.bo[ev.buf].filetype == "markdown" then
                        vim.schedule(function() set_wikipeek_keymaps(ev.buf) end)
                    end
                end,
            })
        end
    },
}
