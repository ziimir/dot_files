return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            enabled = false,
            anti_conceal = { enabled = false },
            heading = { atx = false, position = 'inline' }
        }
    },
    {
        'SCJangra/table-nvim',
        ft = 'markdown',
        opts = {},
    },
}
