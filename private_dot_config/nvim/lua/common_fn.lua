P = function(v)
    print(vim.inspect(v))
    return v
end

PB = function(v)
    vim.api.nvim_put({ vim.inspect(v) }, "", false, false)
end
