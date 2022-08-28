require("common_fn")

use ("fannheyward/telescope-coc.nvim")

use {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  config = function()
    require("configs/telescope_layout").bottom_pane_vertical()
    require("telescope").load_extension("coc")
    require("telescope").setup({
      defaults = {
        layout_strategy = "bottom_pane_vertical",
        results_title = "",
        dynamic_preview_title = true
      },
      extensions = {
        coc = {
          prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
          prefer_references = true
        }
      }
    })
  end
}
