require('common_fn')

use({
    'junegunn/fzf.vim',
    requires = '/usr/local/opt/fzf',
    config = function()
        vim.g.fzf_preview_window = {'up:50%', 'ctrl-t'}
        vim.g.fzf_layout = {down = '100%'}

        -- setting up fzf move preview
        vim.env.FZF_DEFAULT_OPTS = '--bind ctrl-d:preview-half-page-down --bind ctrl-u:preview-half-page-up'
        -- fzf by default use bat if it is available, setting up light theme here
        vim.env.BAT_THEME = 'GitHub'

        vim.api.nvim_set_keymap('n', '<Leader>st', ':call fzf#sonictemplate#run()<CR>', {noremap = true})
        vim.api.nvim_set_keymap('n', '<Leader>ff', ':GFiles<CR>', {noremap = true})
        vim.api.nvim_set_keymap('n', '<Leader>f.', ':GFiles?<CR>', {noremap = true})
        vim.keymap.set(
            'n',
            '<Leader>fp',
            function()
                local path = vim.fn.expand('<cfile>');
                return vim.fn['fzf#vim#files'](
                    '',
                    {options = '--query ' .. string.gsub(path, '%.?%.%/', '')}
                )
            end,
            {noremap = true}
        )
    end
})
