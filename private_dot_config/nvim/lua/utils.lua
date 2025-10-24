local M = {}

M.exclude_filetypes = function(exclude_list)
    local all_fts = vim.fn.getcompletion("", "filetype")

    local filtered = {}
    for _, ft in ipairs(all_fts) do
        if not vim.tbl_contains(exclude_list, ft) then
            table.insert(filtered, ft)
        end
    end

    return filtered
end

M.get_visual_selection = function()
    local bufnr                = 0                                     -- текущий буфер
    local start_pos            = vim.api.nvim_buf_get_mark(bufnr, "<") -- начало выделения
    local end_pos              = vim.api.nvim_buf_get_mark(bufnr, ">") -- конец выделения

    local start_row, start_col = start_pos[1] - 1, start_pos[2]
    local end_row, end_col     = end_pos[1] - 1, end_pos[2] + 1 -- включительно

    local lines                = vim.api.nvim_buf_get_text(bufnr, start_row, start_col, end_row, end_col, {})
    return table.concat(lines, "\n")
end

M.escape_for_regex = function(s)
    -- В Lua-шаблоне % — экранирующий символ, поэтому каждый спец символ предшествует %
    return s:gsub("([%^%$%(%)%%.%[%]%*%+%-%?%|%{%}])", "\\%1")
end

-- https://stackoverflow.com/questions/76491151/delaying-lua-function-so-it-runs-after-neovim-has-successfully-launched
M.delayed_start_up_func = function()
    local timer = vim.loop.new_timer()
    -- Delay 2000ms and 0 means "do not repeat"
    timer:start(2000, 0, vim.schedule_wrap(
        function()
            print("My start-up function here")
        end
    ))
end

return M
