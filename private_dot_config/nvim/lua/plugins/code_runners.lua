-- NODE
-- execute
vim.api.nvim_create_user_command(
    "NodeExe",
    function()
        vim.cmd [[:AsyncRun -mode=term -pos=floaterm node $(VIM_FILEPATH)]]
    end,
    { nargs = 0 }
)

-- repl with loaded file
vim.api.nvim_create_user_command(
    "NodeREPL",
    function()
        vim.cmd [[:AsyncRun -mode=term -pos=floaterm node -i -e "$(< $(VIM_FILEPATH))"]]
    end,
    { nargs = 0 }
)

-- C
-- compile
vim.api.nvim_create_user_command(
    "ClangCmp",
    function()
        vim.cmd [[:AsyncRun -cwd=$(VIM_FILEDIR) gcc $(VIM_FILEPATH) -o $(VIM_FILEDIR)/$(VIM_FILENOEXT)]]
    end,
    { nargs = 0 }
)

-- compile + execute
vim.api.nvim_create_user_command(
    "ClangExe",
    function()
        vim.cmd [[:AsyncRun -mode=term -pos=floaterm -cwd=$(VIM_FILEDIR) gcc $(VIM_FILEPATH) -o $(VIM_FILEDIR)/$(VIM_FILENOEXT) && $(VIM_FILEDIR)/$(VIM_FILENOEXT)]]
    end,
    { nargs = 0 }
)

local runners_by_filetype = {
    javascript = {
        { label = "Node: execute file",        command = "NodeExe",  order = 9 },
        { label = "Node: open REPL with file", command = "NodeREPL", order = 1 },
    },
    c = {
        { label = "C: compile",             command = "ClangCmp", order = 1 },
        { label = "C: compile and execute", command = "ClangExe", order = 9 },
    },
}

local function open_code_runner_picker()
    local filetype = vim.bo.filetype
    local runners = runners_by_filetype[filetype]

    if not runners then
        vim.notify("No code runners for filetype: " .. filetype, vim.log.levels.WARN)
        return
    end

    local sorted_runners = {}

    for index, runner in ipairs(runners) do
        table.insert(sorted_runners, vim.tbl_extend("force", runner, { index = index }))
    end

    table.sort(sorted_runners, function(left, right)
        local left_order = left.order or 100
        local right_order = right.order or 100

        if left_order == right_order then
            return left.index < right.index
        end

        return left_order < right_order
    end)

    local labels = {}
    local commands_by_label = {}

    for _, runner in ipairs(sorted_runners) do
        table.insert(labels, runner.label)
        commands_by_label[runner.label] = runner.command
    end

    return vim.fn['fzf#run'](
        vim.fn['fzf#wrap']({
            source = labels,
            sink = function(label)
                local command = commands_by_label[label]

                if command then
                    vim.cmd(command)
                end
            end,
        })
    )
end

vim.api.nvim_create_user_command("CodeRunner", open_code_runner_picker, { nargs = 0 })
vim.keymap.set("n", "<F5>", open_code_runner_picker, { silent = true, desc = "Code runner" })

return {}
