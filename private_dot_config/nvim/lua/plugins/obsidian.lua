return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    --ft = "markdown",
    event = {
        -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
        -- refer to `:h file-pattern` for more examples
        "BufReadPre " .. vim.fn.expand "~" .. "/Documents/obsidian/*.md"
    },
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "english",
                path = "~/Documents/obsidian/english",
            },
        },
        completion = {
            nvim_cmp = false,
            blink = true,
            min_chars = 0,
        },
    },
    init = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("MyLspOnAttach", { clear = true }),
            callback = function(args)
                local bufnr = args.buf
                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
                end

                map("n", "<space>h", vim.lsp.buf.hover, "Obs: Hover")
                map("n", "<space>d", "<CMD>Obsidian follow_link<CR>", "Obs: Follow link")
                map("n", "<space>D", function()
                    vim.cmd("Obsidian follow_link vsplit")
                    -- дождаться, пока плагин реально откроет сплит и переключится
                    vim.schedule(function()
                        -- перенос текущего окна в новый таб
                        vim.cmd("wincmd T")
                    end)
                end, "Obs: open link in new tab")
            end,
        })
        vim.api.nvim_create_autocmd("User", {
            pattern = "ObsidianNoteEnter",
            callback = function(ev)
                vim.keymap.del("n", "<CR>", { buffer = ev.buf })
            end,
        })
    end
}
