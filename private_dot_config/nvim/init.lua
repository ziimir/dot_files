require("common_options")
require("common_fn")

require("bootstrap_lazy")

require("lazy").setup({
    defaults = {
        lazy = false
    },
    rocks = {
        enabled = false
    },
    spec = {
        -- import your plugins
        { import = "plugins" }
    },
    -- automatically check for plugin updates
    checker = { enabled = false }
})

require("snippets/frontend")
