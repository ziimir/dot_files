-- HASKELL
-- execute
vim.api.nvim_create_user_command(
    'HaskellEx',
    function()
        cmd [[:AsyncRun -mode=term -pos=floaterm ghc $(VIM_FILEPATH) && $(VIM_PATHNOEXT)]]
    end,
    {nargs = 0}
)

-- repl with loaded file
vim.api.nvim_create_user_command(
    'HaskellRunInt',
    function()
        cmd [[:AsyncRun -mode=term -pos=floaterm ghci $(VIM_FILEPATH)]]
    end,
    {nargs = 0}
)

local haskellCodeHelpersGroup = vim.api.nvim_create_augroup('HaskellCodeHelpersGroup', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'haskell'},
    callback = function()
        vim.keymap.set('n', '<space>1', ':HaskellRunInt<CR>', {silent = true})
        vim.keymap.set('n', '<space>2', ':HaskellEx<CR>', {silent = true})
    end,
    group = haskellCodeHelpersGroup
})

-- NODE
-- execute
vim.api.nvim_create_user_command(
    'NodeEx',
    function()
        cmd [[:AsyncRun -mode=term -pos=floaterm node $(VIM_FILEPATH)]]
    end,
    {nargs = 0}
)

-- repl with loaded file
vim.api.nvim_create_user_command(
    'NodeRunInt',
    function()
        cmd [[:AsyncRun -mode=term -pos=floaterm node -i -e "$(< $(VIM_FILEPATH))"]]
    end,
    {nargs = 0}
)

local nodeCodeHelpersGroup = vim.api.nvim_create_augroup("NodeCodeHelpersGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = {'javascript'},
    callback = function()
        vim.keymap.set('n', '<space>1', ':NodeRunInt<CR>', {silent = true})
        vim.keymap.set('n', '<space>2', ':NodeEx<CR>', {silent = true})
    end,
    group = nodeCodeHelpersGroup
})
