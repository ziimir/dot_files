require('common_fn')

use({
  'diepm/vim-rest-console',
  config = function ()
    vim.g.vrc_curl_opts = {
      ['--silent'] = '',
      ['--include'] = '',
    }
    vim.g.vrc_include_response_header = 1
  end
})

--use({
  --'mistweaverco/kulala.nvim',
  --config = function()
    --require('kulala').setup()
    --vim.filetype.add({
      --extension = {
        --['http'] = 'http',
      --},
    --})

    --local httpClientGroup = vim.api.nvim_create_augroup("HttpClientGroup", { clear = true })
    --vim.api.nvim_create_autocmd("FileType", {
        --pattern = {'http'},
        --callback = function()
          --vim.api.nvim_set_keymap("n", "<F9>", ":lua require('kulala').run()<CR>", { noremap = true, silent = true })
          --vim.api.nvim_set_keymap("n", "<space>t", ":lua require('kulala').toggle_view()<CR>", { noremap = true, silent = true })
        --end,
        --group = httpClientGroup
    --})
  --end
--})
