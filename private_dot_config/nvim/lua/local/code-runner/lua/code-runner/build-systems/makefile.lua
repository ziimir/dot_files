local M = {}

local function find_makefile()
    local buffer_path = vim.api.nvim_buf_get_name(0)
    local start_path = buffer_path ~= "" and vim.fs.dirname(buffer_path) or vim.fn.getcwd()

    return vim.fs.find("Makefile", { path = start_path, upward = true })[1]
end

local function get_phony_targets(makefile)
    local ok, lines = pcall(vim.fn.readfile, makefile)

    if not ok then
        vim.notify("Could not read Makefile: " .. makefile, vim.log.levels.ERROR)
        return {}
    end

    local targets = {}
    local seen_targets = {}
    local phony_line = nil

    for _, line in ipairs(lines) do
        local current_line = nil

        if phony_line then
            current_line = line
        else
            current_line = line:match("^%s*%.PHONY%s*:%s*(.*)$")
        end

        if current_line then
            phony_line = (phony_line and (phony_line .. " ") or "") .. current_line

            if not phony_line:match("\\%s*$") then
                phony_line = phony_line:gsub("%s+#.*$", "")

                for target in phony_line:gmatch("%S+") do
                    if not seen_targets[target] then
                        table.insert(targets, target)
                        seen_targets[target] = true
                    end
                end

                phony_line = nil
            else
                phony_line = phony_line:gsub("\\%s*$", "")
            end
        end
    end

    return targets
end

function M.open()
    local makefile = find_makefile()

    if not makefile then
        vim.notify("No Makefile found", vim.log.levels.WARN)
        return
    end

    local targets = get_phony_targets(makefile)

    if #targets == 0 then
        vim.notify("No .PHONY targets found in " .. makefile, vim.log.levels.WARN)
        return
    end

    return vim.fn['fzf#run'](
        vim.fn['fzf#wrap']({
            source = targets,
            options = { "--prompt=build> " },
            sink = function(target)
                local makefile_dir = vim.fn.fnamemodify(makefile, ":h")
                --local command = "make " .. vim.fn.shellescape(target)
                local command = "make " .. target

                require("tmux-command-runner").run(command, { cwd = makefile_dir })
            end,
        })
    )
end

return M
