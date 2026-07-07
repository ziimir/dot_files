return {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    dependencies = {
        {
            -- `snacks.nvim` integration is recommended, but optional
            ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
            "folke/snacks.nvim",
            optional = true,
            opts = {
                input = {}, -- Enhances `ask()`
                picker = {  -- Enhances `select()`
                    actions = {
                        opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
                    },
                    win = {
                        input = {
                            keys = {
                                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                            },
                        },
                    },
                },
            },
        },
    },
    config = function()
        --local opencode_cmd = "opencode --port"
        --local floaterm_name = "opencode"
        --vim.g.opencode_opts = {
        --server = {
        --start = function()
        --vim.notify("opencode.nvim server.start via floaterm")
        --vim.cmd(
        --"FloatermNew "
        --.. "--name=" .. floaterm_name .. " "
        --.. opencode_cmd
        --)
        --end,
        --toggle = function()
        --vim.cmd("FloatermToggle " .. floaterm_name)
        --end,
        --stop = function()
        --vim.cmd("FloatermKill " .. floaterm_name)
        --end,
        --},
        --}

        vim.o.autoread = true -- Required for `opts.events.reload`

        -- Recommended/example keymaps
        vim.keymap.set(
            { "n", "x" },
            "<Leader>aa",
            function() require("opencode").ask("@this: ", { submit = true }) end,
            { desc = "Ask opencode…" }
        )
        vim.keymap.set(
            { "n", "x" },
            "<Leader>ax",
            function() require("opencode").select() end,
            { desc = "Select opencode…" }
        )
        vim.keymap.set(
            { "n", "t" },
            "<Leader>at",
            function() require("opencode").toggle() end,
            --function()
            --for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            --if vim.api.nvim_buf_is_valid(buf) and vim.b[buf].floaterm_name == floaterm_name then
            --vim.cmd("FloatermToggle " .. floaterm_name)
            --return
            --end
            --end

            --vim.cmd(
            --"FloatermNew " .. "--name=" .. floaterm_name .. " " .. opencode_cmd
            --)
            --end,
            { desc = "Toggle opencode" }
        )

        vim.keymap.set(
            "n",
            "<M-u>",
            function() require("opencode").command("session.half.page.up") end,
            { desc = "Scroll opencode up" }
        )
        vim.keymap.set(
            "n",
            "<M-d>",
            function() require("opencode").command("session.half.page.down") end,
            { desc = "Scroll opencode down" }
        )
    end,
}
