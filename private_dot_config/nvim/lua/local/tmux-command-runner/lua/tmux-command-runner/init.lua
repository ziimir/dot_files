local M = {}

local config = {
    idle_commands = { "zsh", "bash", "sh" },
}

local function is_idle_command(command)
    for _, idle_command in ipairs(config.idle_commands) do
        if command == idle_command then
            return true
        end
    end

    return false
end

local function find_nearest_idle_tmux_pane(cwd)
    local tmux_command = vim.g.VimuxTmuxCommand or "tmux"
    local panes = vim.fn.systemlist({ tmux_command, "list-panes", "-F", "#{pane_active}\t#{pane_id}\t#{pane_current_command}\t#{pane_current_path}" })

    if vim.v.shell_error ~= 0 then
        return nil
    end

    for _, pane in ipairs(panes) do
        local active, pane_id, current_command, current_path = pane:match("^([^\t]+)\t([^\t]+)\t([^\t]+)\t(.+)$")

        if active ~= "1" and current_path == cwd then
            return is_idle_command(current_command) and pane_id or nil
        end
    end

    return nil
end

function M.setup(opts)
    config = vim.tbl_deep_extend("force", config, opts or {})
end

function M.run(command, opts)
    opts = opts or {}

    local previous_use_nearest = vim.g.VimuxUseNearest
    local previous_open_extra_args = vim.g.VimuxOpenExtraArgs
    local cwd = opts.cwd or vim.fn.getcwd()
    local idle_pane = find_nearest_idle_tmux_pane(cwd)

    if idle_pane then
        vim.g.VimuxRunnerIndex = idle_pane
        vim.g.VimuxUseNearest = 1
    else
        vim.g.VimuxUseNearest = 0
        vim.g.VimuxOpenExtraArgs = "-c " .. vim.fn.shellescape(cwd)
        vim.cmd("unlet! g:VimuxRunnerIndex")
    end

    local ok, err = pcall(vim.fn.VimuxRunCommand, command)

    if previous_use_nearest == nil then
        vim.cmd("unlet! g:VimuxUseNearest")
    else
        vim.g.VimuxUseNearest = previous_use_nearest
    end

    if previous_open_extra_args == nil then
        vim.cmd("unlet! g:VimuxOpenExtraArgs")
    else
        vim.g.VimuxOpenExtraArgs = previous_open_extra_args
    end

    if not ok then
        error(err)
    end
end

return M
