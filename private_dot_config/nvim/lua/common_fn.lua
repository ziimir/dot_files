cmd = vim.cmd             -- execute Vim commands
exec = vim.api.nvim_exec  -- execute Vimscript
use = require'packer'.use

P = function(v)
  print(vim.inspect(v))
  return v
end
