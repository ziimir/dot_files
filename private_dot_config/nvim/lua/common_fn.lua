cmd = vim.cmd             -- execute Vim commands
exec = vim.api.nvim_exec  -- execute Vimscript
use = require'packer'.use

P = function(v)
  print(vim.inspect(v))
  return v
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
