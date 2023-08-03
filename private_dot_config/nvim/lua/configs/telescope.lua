require("common_fn")

use {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  config = function()
    require("configs/telescope_layout").bottom_pane_vertical()
    require("telescope").setup({
      defaults = {
        path_display = {'hidden'},
        layout_strategy = 'bottom_pane_vertical',
        vimgrep_arguments = {
          'ag',
          '--vimgrep'
        }
      },
      extensions = {
      }
    })
  end
}
