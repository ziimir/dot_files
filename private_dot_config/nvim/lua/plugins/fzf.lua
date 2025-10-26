return {
    {
        "junegunn/fzf.vim",
        dependencies = "junegunn/fzf",
        init = function()
            vim.g.fzf_preview_window = { 'up:50%', 'ctrl-/' }
            vim.g.fzf_layout = { down = '100%' }
            vim.g.fzf_action = {
                ["ctrl-t"] = 'tab split',
                ["ctrl-x"] = 'split',
                ["ctrl-v"] = 'vsplit',
                ["ctrl-q"] = function(selected)
                    local items = {}
                    for _, path in ipairs(selected) do
                        local preview = vim.fn.readfile(path, 1)[1] or ""
                        table.insert(items, {
                            filename = path,
                            lnum = 1,
                            col = 1,
                            text = preview,
                        })
                    end
                    vim.fn.setqflist({}, 'r', { title = 'fzf', items = items })
                    vim.cmd('copen')
                end
            }

            -- respecting ignore files
            vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git" --glob "!.obsidian"'
            -- setting up fzf move preview
            vim.env.FZF_DEFAULT_OPTS = '--bind ctrl-e:preview-half-page-down --bind ctrl-y:preview-half-page-up'
            -- fzf by default use bat if it is available, setting up light theme here
            vim.env.BAT_THEME = 'GitHub'

            vim.api.nvim_set_keymap('n', '<Leader>st', ':call fzf#sonictemplate#run()<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>ff', ':Files<CR>', { noremap = true })
            vim.api.nvim_set_keymap('n', '<Leader>f.', ':GFiles?<CR>', { noremap = true })

            vim.keymap.set(
                'n',
                '<Leader>fp',
                function()
                    local path = vim.fn.expand('<cfile>');
                    return vim.fn['fzf#vim#files'](
                        '',
                        { options = '--query ' .. string.gsub(path, '%.?%.%/', '') }
                    )
                end,
                { noremap = true }
            )
        end
    }
}
