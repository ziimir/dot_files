P = function(v)
    print(vim.inspect(v))
    return v
end

PB = function(v)
    vim.api.nvim_put({ vim.inspect(v) }, "", false, false)
end

EXCLUDE_FILETYPES = function(exclude_list)
    local all_fts = vim.fn.getcompletion("", "filetype")

    local filtered = {}
    for _, ft in ipairs(all_fts) do
        if not vim.tbl_contains(exclude_list, ft) then
            table.insert(filtered, ft)
        end
    end

    return filtered
end


-- https://stackoverflow.com/questions/76491151/delaying-lua-function-so-it-runs-after-neovim-has-successfully-launched
local function start_up_func()
    print("My start-up function here")
end

local function delayed_start_up_func()
    local timer = vim.loop.new_timer()
    -- Delay 2000ms and 0 means "do not repeat"
    timer:start(2000, 0, vim.schedule_wrap(start_up_func))
end

-- delayed_start_up_func()
