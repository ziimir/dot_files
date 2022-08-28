local resolve = require "telescope.config.resolve"
local p_window = require "telescope.pickers.window"

-- copypaste from ~/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/layout_strategies.lua
local get_border_size = function(opts)
  if opts.window.border == false then
    return 0
  end

  return 1
end

-- copypaste from ~/.local/share/nvim/site/pack/packer/start/telescope.nvim/lua/telescope/pickers/layout_strategies.lua
local calc_tabline = function(max_lines)
  local tbln = (vim.o.showtabline == 2) or (vim.o.showtabline == 1 and #vim.api.nvim_list_tabpages() > 1)
  if tbln then
    max_lines = max_lines - 1
  end
  return max_lines, tbln
end

local telescope_utils = {}

function telescope_utils.bottom_pane_vertical()
  require("telescope.pickers.layout_strategies").bottom_pane_vertical = function(self, max_columns, max_lines)
    local initial_options = p_window.get_initial_window_options(self)
    local preview = initial_options.preview
    local results = initial_options.results
    local prompt = initial_options.prompt

    local tbln
    max_lines, tbln = calc_tabline(max_lines)

    local bs = get_border_size(self)

    local height = max_lines
    local width = max_columns - 2 * bs

    prompt.width = width
    results.width = width
    preview.width = width

    prompt.height = 1
    preview.height = resolve.resolve_height(0.5)(self, max_columns, height)
    results.height = height - (preview.height + 1 * bs) - (prompt.height + 2 * bs)

    prompt.col = 2
    results.col = 2
    preview.col = 2

    preview.line = bs
    results.line = max_lines - (results.height + bs)
    prompt.line = max_lines

    results.border = { 1, 0, 0, 0 }
    prompt.border = { 1, 0, 1, 0 }

    if type(prompt.title) == "string" then
      prompt.title = { { pos = "N", text = prompt.title } }
    end

    if tbln then
      preview.line = preview.line + 1
    end

    return {
      preview = self.previewer and preview.height > 0 and preview,
      results = results,
      prompt = prompt,
    }
  end
end

return telescope_utils
