local M = {}

local config = {
    keymap = "<F5>",
    build_systems = {
        makefile = require("code-runner.build-systems.makefile"),
    },
    build_systems_by_filetype = {
        c = "makefile",
    },
    filetypes = {
        javascript = require("code-runner.filetypes.javascript"),
        c = require("code-runner.filetypes.c"),
    },
}

local function current_filetype_config(filetype)
    return config.filetypes[filetype or vim.bo.filetype]
end

local function sorted_runners(runners)
    local result = {}

    for index, runner in ipairs(runners) do
        table.insert(result, vim.tbl_extend("force", runner, { index = index }))
    end

    table.sort(result, function(left, right)
        local left_order = left.order or 100
        local right_order = right.order or 100

        if left_order == right_order then
            return left.index < right.index
        end

        return left_order < right_order
    end)

    return result
end

local function run_command(command)
    if type(command) == "function" then
        command = command()
    end

    if command and command ~= "" then
        vim.cmd(command)
    end
end

local function run_runner(runner)
    if runner.run then
        runner.run(runner)
        return
    end

    run_command(runner.command)
end

function M.open_build_picker(filetype)
    local name = filetype or vim.bo.filetype
    local build_system_name = config.build_systems_by_filetype[name]
    local build_system = build_system_name and config.build_systems[build_system_name]

    if not build_system then
        vim.notify("No build system for filetype: " .. name, vim.log.levels.WARN)
        return
    end

    if build_system.open then
        return build_system.open()
    end

    vim.notify("Build system has no picker: " .. tostring(build_system_name), vim.log.levels.WARN)
end

function M.open_runner_picker(filetype)
    local name = filetype or vim.bo.filetype
    local filetype_config = current_filetype_config(name)
    local runners = filetype_config and filetype_config.runners

    if not runners then
        vim.notify("No code runners for filetype: " .. name, vim.log.levels.WARN)
        return
    end

    local labels = {}
    local runners_by_label = {}

    for _, runner in ipairs(sorted_runners(runners)) do
        table.insert(labels, runner.label)
        runners_by_label[runner.label] = runner
    end

    return vim.fn['fzf#run'](
        vim.fn['fzf#wrap']({
            source = labels,
            sink = function(label)
                local runner = runners_by_label[label]

                if runner then
                    run_runner(runner)
                end
            end,
        })
    )
end

function M.open(filetype)
    local name = filetype or vim.bo.filetype

    if config.build_systems_by_filetype[name] then
        return M.open_build_picker(name)
    end

    return M.open_runner_picker(name)
end

function M.setup(opts)
    config = vim.tbl_deep_extend("force", config, opts or {})

    vim.api.nvim_create_user_command("CodeRunner", function()
        M.open()
    end, { nargs = 0 })

    vim.api.nvim_create_user_command("CodeRunnerCommands", function()
        M.open_runner_picker()
    end, { nargs = 0 })

    vim.api.nvim_create_user_command("BuildRunner", function()
        M.open_build_picker()
    end, { nargs = 0 })

    if config.keymap then
        vim.keymap.set("n", config.keymap, function()
            M.open()
        end, { silent = true, desc = "Code runner" })
    end
end

return M
