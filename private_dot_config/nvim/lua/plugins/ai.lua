return {
    {
        "ravitemer/mcphub.nvim",
        enabled = false,
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
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = function()
            local function memory_bank_toc(max_files)
                local dir = vim.fn.getcwd() .. "/memory-bank"
                if vim.fn.isdirectory(dir) == 0 then return "" end
                local files = vim.fn.globpath(dir, "*.md", false, true)
                table.sort(files)
                local lines = { "Memory Bank TOC:" }
                for i, f in ipairs(files) do
                  if i > (max_files or 12) then break end
                  local rel = vim.fn.fnamemodify(f, ":.")
                  local mtime = vim.fn.getftime(f)
                  table.insert(lines, ("- %s (updated %s)"):format(rel, os.date("%Y-%m-%d", mtime)))
                end
                return table.concat(lines, "\n")
            end

            return {
                -- 1) мягко переписываем системный промпт (идёт в КАЖДЫЙ запрос)
                system_prompt = function()
                    return [[Ты ассистент для разработки в Neovim.
                        Перед ответом:
                        1) Проверь в проекте папку `memory-bank/` (projectbrief.md, techContext.md, codingStandards.md, activeContext.md).
                        2) Если нужно больше контекста — сначала найди и прочитай релевантные файлы, затем кратко резюмируй и только после этого отвечай.]]
                end,

                strategies = {
                    chat = {
                        opts = {
                          -- встроенная функция декорации перед отправкой
                          -- (официальная точка расширения)
                          prompt_decorator = function(message, adapter, context)
                            local toc = memory_bank_toc()
                            if toc ~= "" then
                              message = toc ..
                                "\n\nЕсли нужен контекст — сначала прочитай файлы из списка (через инструменты поиска/чтения), затем ответь.\n\n"
                                .. message
                            end
                            return message
                          end,
                        },

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
                        tools = {
                            -- grep_search = локальный ripgrep-поиск, files = чтение файлов
                            -- (оба штатные у CodeCompanion)
                            opts = {
                                default_tools = { "grep_search", "files" },
                                auto_submit_success = true
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
            }
        end
    },
}
