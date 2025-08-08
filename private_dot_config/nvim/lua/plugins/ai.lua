return {
    {
        "ravitemer/mcphub.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        build = "npm install -g mcp-hub@latest",
        config = function()
            require("mcphub").setup()
        end
    },
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            strategies = {
                chat = {
                    adapter = "openai",
                    send = {
                        modes = {
                            n = { "<C-s>" },
                        },
                    },
                    slash_commands = {
                        ["path"] = {
                          description = "Вставить путь папке текущего буффера",
                          callback = function(chat)
                            local abs = vim.api.nvim_buf_get_name(0)
                            local rel = vim.fn.fnamemodify(abs, ':.')
                            --local path = vim.fn.fnamemodify(rel, ':r')
                            local path = vim.fn.fnamemodify(rel, ':h')
                            return chat:add_buf_message({ content = path })
                          end,
                          opts = { contains_code = false },
                        },
                    },
                },
                inline = { adapter = "openai" },
                cmd = { adapter = "openai" },
            },
            adapters = {
                openai = function()
                    return require("codecompanion.adapters").extend("openai", {
                        env = {
                            api_key = "cmd:cat ~/.gpt_key | tr -d '\n'",
                        },
                    })
                end
            },
            extensions = {
                mcphub = {
                    callback = "mcphub.extensions.codecompanion",
                    opts = {
                        -- MCP Tools
                        make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
                        show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
                        add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
                        show_result_in_chat = true,      -- Show tool results directly in chat buffer
                        format_tool = nil,               -- function(tool_name:string, tool: CodeCompanion.Agent.Tool) : string Function to format tool names to show in the chat buffer
                        -- MCP Resources
                        make_vars = true,                -- Convert MCP resources to #variables for prompts
                        -- MCP Prompts
                        make_slash_commands = true,      -- Add MCP prompts as /slash commands
                    }
                }
            },
        },
    },
    {
      'saghen/blink.cmp',
      version = '1.*',
      opts = {
        appearance = {
          -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono'
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = {},
          --default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      },
      opts_extend = { "sources.default" }
    }
}
