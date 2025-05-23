-- HASKELL
-- execute
vim.api.nvim_create_user_command(
    "HaskellExe",
    function()
        vim.cmd [[:AsyncRun -mode=term -pos=floaterm ghc $(VIM_FILEPATH) && $(VIM_PATHNOEXT)]]
    end,
    { nargs = 0 }
)

-- repl with loaded file
vim.api.nvim_create_user_command(
    "HaskellREPL",
    function()
        vim.cmd [[:AsyncRun -mode=term -pos=floaterm ghci $(VIM_FILEPATH)]]
    end,
    { nargs = 0 }
)

local haskellCodeHelpersGroup = vim.api.nvim_create_augroup("HaskellCodeHelpersGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "haskell" },
    callback = function()
        vim.keymap.set("n", "<F5>", ":HaskellExe<CR>", { silent = true })
        vim.keymap.set("n", "<F9>", ":HaskellREPL<CR>", { silent = true })
    end,
    group = haskellCodeHelpersGroup
})

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

local nodeCodeHelpersGroup = vim.api.nvim_create_augroup("NodeCodeHelpersGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "javascript" },
    callback = function()
        vim.keymap.set("n", "<F5>", ":NodeExe<CR>", { silent = true })
        vim.keymap.set("n", "<F9>", ":NodeREPL<CR>", { silent = true })
    end,
    group = nodeCodeHelpersGroup
})

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

local clangCodeHelpersGroup = vim.api.nvim_create_augroup("ClangCodeHelpersGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c" },
    callback = function()
        vim.keymap.set("n", "<F7>", ":ClangCmp<CR>", { silent = true })
        vim.keymap.set("n", "<F5>", ":ClangExe<CR>", { silent = true })
    end,
    group = clangCodeHelpersGroup
})

-- RUST
-- compile + execute
vim.api.nvim_create_user_command(
    "CargoRun",
    function()
        vim.cmd [[:AsyncRun -mode=term -pos=floaterm -cwd=$(VIM_CWD) cargo run]]
    end,
    { nargs = 0 }
)

local rustCodeHelpersGroup = vim.api.nvim_create_augroup("RustCodeHelpersGroup", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "rust" },
    callback = function()
        vim.keymap.set("n", "<F5>", ":CargoRun<CR>", { silent = true })
    end,
    group = rustCodeHelpersGroup
})

return {}
