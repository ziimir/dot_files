return {
    {
        "ziimir/root-climber.nvim",
        dev = true,
        init = function()
            vim.g["root_climber#always_confirm"] = 0

            vim.api.nvim_create_user_command(
                "TestRootClimber",
                function(args_table)
                    require("root-climber").run(
                        args_table.args,
                        function(checked)
                            if checked == nil then
                                print("nothing")
                            else
                                print(checked)
                            end
                        end
                    )
                end,
                { nargs = 1 }
            )

            vim.api.nvim_create_user_command(
                "FzfTestRootClimber",
                function(args_table)
                    require("root-climber").fzf_run(
                        args_table.args,
                        function(checked)
                            if checked == nil then
                                print("nothing")
                            else
                                print(checked)
                            end
                        end
                    )
                end,
                { nargs = 1 }
            )
        end
    },
    {
        "vim-test/vim-test",
        init = function()
            vim.g["test#strategy"] = "floaterm"
            vim.g["test#javascript#mocha#file_pattern"] = "\\v(tests?/.*|(test))\\.(js|jsx|ts|tsx)$"
            vim.g["test#javascript#jest#file_pattern"] = "\\v(__tests__/.*|(spec|test))\\.(js|jsx|ts|tsx)$"
            vim.g["test#javascript#karma#file_pattern"] = "\\v(test|spec)\\.(js|jsx|ts|tsx)$"
            vim.g["test#javascript#jasmine#file_pattern"] = "\\v^spec/.*spec\\.(js|jsx|ts|tsx)$"

            vim.api.nvim_create_user_command(
                "DebugFile",
                function(opts)
                    vim.g["test#javascript#jest#executable"] = "node --inspect-brk node_modules/.bin/jest " .. opts.args
                    vim.cmd [[
                        TestFile
                        unlet g:test#javascript#jest#executable
                    ]]
                end,
                { nargs = "*" }
            )

            vim.api.nvim_create_user_command(
                "Jes",
                function(opts)
                    require("root-climber").fzf_run(
                        "*.jest.config.js",
                        function(path)
                            vim.api.nvim_command("TestFile --config " .. path .. " " .. opts.args)
                        end
                    )
                end,
                { nargs = "*" }
            )

            vim.api.nvim_create_user_command(
                "Jed",
                function(opts)
                    vim.g["test#javascript#jest#executable"] = "node --inspect-brk node_modules/.bin/jest"

                    require("root-climber").fzf_run(
                        "*.jest.config.js",
                        function(path)
                            vim.api.nvim_command("TestFile --config " .. path .. " " .. opts.args)
                            vim.cmd [[unlet g:test#javascript#jest#executable]]
                        end
                    )
                end,
                { nargs = "*" }
            )
        end
    }
}
