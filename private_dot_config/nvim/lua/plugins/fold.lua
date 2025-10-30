vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = "kevinhwang91/promise-async",
        opts = {
            provider_selector = function(_, _)
                return { "treesitter", "indent" }
            end,
            enable_get_fold_virt_text = true,
        },
        init = function()
            vim.keymap.set("n", "<BS>", "zc")
            vim.keymap.set("n", "<CR>", "zo")

            local map = function(lhs, rhs, desc)
                vim.keymap.set('n', lhs, rhs, { silent = true, desc = desc })
            end

            -- Развернуть «ниже текущего уровня» под курсором (только поддерево):
            map("zo", function() vim.cmd("normal! zO") end, "FOLD: Open subtree under cursor")

            local ufo = require('ufo')

            -- Свернуть все фолды (аналог zM, но без трогания 'foldlevel')
            map("zM", ufo.closeAllFolds, "FOLD: close ALL folds")
            map("zm", ufo.closeAllFolds, "FOLD: close ALL folds")

            -- Развернуть все фолды (аналог zR, без трогания 'foldlevel')
            map("zR", ufo.openAllFolds, "FOLD: open ALL folds")
            map("zr", ufo.openAllFolds, "FOLD: open ALL folds")

            -- Isolate: оставить открытым только текущий фолд и его детей
            map('zi', function()
                -- если курсор вообще вне фолда — выходим
                local cur  = vim.api.nvim_win_get_cursor(0)[1]
                local last = vim.api.nvim_buf_line_count(0)
                local lvl  = vim.fn.foldlevel(cur)
                local next = (cur < last) and vim.fn.foldlevel(cur + 1) or 0
                if lvl == 0 and next == 0 then
                    return
                end

                ufo.closeAllFolds()           -- закрыть всё
                vim.cmd('silent! normal! zv') -- раскрыть родителей и заголовок текущего
                vim.cmd('silent! normal! zO') -- раскрыть всё поддерево текущей секции
            end, 'FOLD: close all folds except current subtree')
        end
    },
}
