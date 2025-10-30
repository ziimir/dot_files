if vim.g.loaded_mdoutline then return end
vim.g.loaded_mdoutline = true

local ok, mdol = pcall(require, "mdoutline")
if not ok then return end

mdol.setup({
    max_level = nil, -- например, 3, чтобы показывать до H3
})
