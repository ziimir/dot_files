-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/ziimir/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/ziimir/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/ziimir/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/ziimir/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/ziimir/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\n�\1\0\0\b\1\t\0\26-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\6�6\0\1\0009\0\2\0009\0\3\0'\2\4\0B\0\2\1X\0\14�6\0\1\0009\0\2\0009\0\5\0006\2\1\0009\2\2\0029\2\6\2'\4\a\0+\5\2\0+\6\2\0+\a\2\0B\2\5\2'\3\b\0+\4\2\0B\0\4\1K\0\1\0\0�\6n\n<Tab>\27nvim_replace_termcodes\18nvim_feedkeys!<Plug>luasnip-expand-snippet\15nvim_input\bapi\bvim\15expandableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\4�-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0�\tjump\rjumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2��B\0\2\2\15\0\0\0X\1\4�-\0\0\0009\0\1\0)\2��B\0\2\1K\0\1\0\0�\tjump\rjumpable�\1\1\0\a\0\15\0\0296\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0003\5\a\0005\6\b\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\t\0003\5\n\0005\6\v\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0003\5\r\0005\6\14\0B\1\5\0012\0\0�K\0\1\0\1\0\1\vsilent\2\0\n<C-k>\1\0\1\vsilent\2\0\n<C-j>\1\0\1\vsilent\2\0\n<Tab>\6i\bset\vkeymap\bvim\fluasnip\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["ack.vim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\16\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0016\0\4\0'\2\6\0B\0\2\0016\0\4\0'\2\a\0B\0\2\0016\0\4\0'\2\b\0B\0\2\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0004\5\0\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\14\0'\4\15\0004\5\0\0B\0\5\1K\0\1\0!:Ack<Space>\"\\b<cword>\\b\"<CR>\14<Leader>G\16:Ack<Space>\14<Leader>g\6n\20nvim_set_keymap\bapi!cnoreabbrev LAckAdd LAckAdd!\27cnoreabbrev LAck LAck!\31cnoreabbrev AckAdd AckAdd!\25cnoreabbrev Ack Ack!\bcmd\17ag --vimgrep\vackprg\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/ack.vim",
    url = "https://github.com/mileszs/ack.vim"
  },
  ["asyncrun.vim"] = {
    config = { "\27LJ\2\n/\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\19\0=\1\2\0K\0\1\0\18asyncrun_open\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["auto-pairs.git"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/auto-pairs.git",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["clever-f.vim"] = {
    config = { "\27LJ\2\n]\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\24clever_f_smart_case\28clever_f_across_no_line\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/clever-f.vim",
    url = "https://github.com/rhysd/clever-f.vim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cspell.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/cspell.nvim",
    url = "https://github.com/davidmh/cspell.nvim"
  },
  ["diagnostic-window.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/diagnostic-window.nvim",
    url = "https://github.com/cseickel/diagnostic-window.nvim"
  },
  ["editorconfig-vim"] = {
    config = { '\27LJ\2\nZ\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0' },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/editorconfig-vim",
    url = "https://github.com/editorconfig/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/fzf",
    url = "/opt/homebrew/opt/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n�\1\0\0\v\0\f\0\0206\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0005\4\n\0'\5\6\0006\6\a\0009\6\b\6\18\b\0\0'\t\t\0'\n\5\0B\6\4\2&\5\6\5=\5\v\4D\1\3\0\foptions\1\0\0\f%.?%.%/\tgsub\vstring\r--query \5\18fzf#vim#files\f<cfile>\vexpand\afn\bvim�\4\1\0\6\0\28\00016\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\6\0'\1\b\0=\1\a\0006\0\0\0009\0\6\0'\1\n\0=\1\t\0006\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\0\0009\0\23\0009\0\24\0'\2\r\0'\3\25\0003\4\26\0005\5\27\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\0\15<Leader>fp\bset\vkeymap\1\0\1\fnoremap\2\17:GFiles?<CR>\15<Leader>f.\1\0\1\fnoremap\2\16:GFiles<CR>\15<Leader>ff\1\0\1\fnoremap\2&:call fzf#sonictemplate#run()<CR>\15<Leader>st\6n\20nvim_set_keymap\bapi\vGitHub\14BAT_THEMEL--bind ctrl-e:preview-half-page-down --bind ctrl-y:preview-half-page-up\21FZF_DEFAULT_OPTS\benv\1\0\1\tdown\t100%\15fzf_layout\1\3\0\0\vup:50%\vctrl-t\23fzf_preview_window\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["linediff.vim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/linediff.vim",
    url = "https://github.com/AndrewRadev/linediff.vim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\14lightbulb\1\0\1\venable\1\21symbol_in_winbar\1\0\1\venable\1\19scroll_preview\1\0\2\16scroll_down\n<C-d>\14scroll_up\n<C-u>\15definition\1\0\2\vheight\3\1\nwidth\3\1\vfinder\1\0\0\1\0\4\16right_width\4��̙\3���\3\15left_width\4����\t����\3\15max_height\4͙��\f̙��\3\vlayout\vnormal\nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/nvimdev/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neoformat = {
    config = { "\27LJ\2\n�\1\0\0\3\0\6\0\f6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\4\0'\2\5\0B\0\2\1K\0\1\0Lautocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.html Neoformat\bcmd neoformat_only_msg_on_error\27neoformat_try_node_exe\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  nerdcommenter = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  nerdtree = {
    config = { "\27LJ\2\n�\2\0\0\6\0\15\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1<\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22:NERDTreeFind<CR>\n<C-\\>\1\0\1\fnoremap\2\24:NERDTreeToggle<CR>\14<leader>t\6n\20nvim_set_keymap\bapi\29NERDTreeAutoDeleteBuffer\20NERDTreeWinSize\23NERDTreeShowHidden\23NERDTreeQuitOnOpen\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0009\0\1\0'\2\2\0B\0\2\2'\1\3\0&\0\1\0L\0\2\0\30/.config/nvim/cspell.json\tHOME\vgetenv\aos�\2\1\0\b\0\21\0,6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\5\0009\3\3\0009\3\4\3=\3\6\0023\3\a\0=\3\b\0024\3\5\0009\4\t\0019\4\n\0045\6\v\0=\2\f\6B\4\2\2>\4\1\0039\4\r\0019\4\n\0045\6\14\0=\2\f\6B\4\2\2>\4\2\0039\4\15\0009\4\t\0049\4\16\0049\4\n\0045\6\17\0009\a\3\0009\a\4\a=\a\6\6B\4\2\2>\4\3\0039\4\15\0009\4\r\0049\4\16\4>\4\4\0039\4\18\0005\6\19\0=\3\20\6B\4\2\1K\0\1\0\fsources\1\0\0\nsetup\1\0\0\reslint_d\rbuiltins\1\0\0\17code_actions\vconfig\1\0\0\twith\16diagnostics\14find_json\0\vmethod\1\0\0\24DIAGNOSTICS_ON_SAVE\fmethods\vcspell\fnull-ls\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\n�\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vbuffer\3\0\6j\n<C-n>\1\0\1\vbuffer\3\0\6k\n<C-p>\6n\bset\vkeymap\bvim�\3\1\0\6\0\21\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0'\2\v\0005\3\f\0B\0\3\0026\1\b\0009\1\t\0019\1\r\1'\3\14\0005\4\16\0005\5\15\0=\5\17\0043\5\18\0=\5\19\4=\0\20\4B\1\3\1K\0\1\0\ngroup\rcallback\0\fpattern\1\0\0\1\2\0\0\aqf\rFileType\24nvim_create_autocmd\1\0\1\nclear\2\23QfEnhancementGroup\24nvim_create_augroup\bapi\bvim\rfunc_map\1\0\4\16pscrolldown\n<C-e>\rprevfile\v<C-f>[\14pscrollup\n<C-y>\rnextfile\v<C-f>]\fpreview\1\0\0\1\0\3\15win_height\3�\a\rwinblend\3\0\17auto_preview\1\nsetup\bbqf\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/opt/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\2\0\0\n\0\22\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\17\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\a)\t��B\a\2\2=\a\b\0069\a\3\0009\a\6\a)\t\4\0B\a\2\2=\a\t\0069\a\3\0009\a\n\aB\a\1\2=\a\v\0069\a\3\0009\a\f\aB\a\1\2=\a\r\0069\a\3\0009\a\14\a5\t\15\0B\a\2\2=\a\16\6B\4\2\2=\4\3\0034\4\4\0005\5\18\0>\5\1\0045\5\19\0>\5\2\0045\5\20\0>\5\3\4=\4\21\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-g>\nabort\n<C-l>\rcomplete\n<C-d>\n<C-u>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nU\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\0\1\0\1\vcss_fn\2\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\n\0\0\a\0005\0�\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0015\0\a\0006\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\14\0006\5\b\0009\5\15\0059\5\16\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\17\0006\5\b\0009\5\15\0059\5\18\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\19\0006\5\b\0009\5\15\0059\5\20\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\21\0006\5\b\0009\5\15\0059\5\22\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\23\0006\5\b\0009\5\24\0059\5\25\0059\5\26\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\27\0006\5\b\0009\5\24\0059\5\25\0059\5\28\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\29\0006\5\b\0009\5\24\0059\5\25\0059\5\30\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\31\0006\5\b\0009\5\24\0059\5\25\0059\5 \5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4!\0'\5\"\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4#\0'\5$\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4%\0'\5&\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4'\0006\5\b\0009\5\24\0059\5\25\0059\5(\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\0015\3)\0'\4*\0006\5\b\0009\5\24\0059\5\25\0059\5+\5\18\6\0\0B\1\5\0016\1\0\0'\3,\0B\1\2\0029\2-\0019\2\2\0024\4\0\0B\2\2\0019\2.\0019\2\2\0024\4\0\0B\2\2\0019\2/\0019\2\2\0025\0043\0005\0051\0005\0060\0=\0062\5=\0054\4B\2\2\1K\0\1\0\rsettings\1\0\0\18stylelintplus\1\0\0\1\0\2\19validateOnSave\2\19validateOnType\1\18stylelint_lsp\vclangd\rtsserver\14lspconfig\16code_action\r<space>a\1\3\0\0\6n\6v\vrename\r<space>r :Lspsaga finder def+ref<CR>\r<space>*&:Lspsaga peek_type_definition<CR>\r<space>T!:Lspsaga peek_definition<CR>\r<space>D\20type_definition\r<space>t\15definition\r<space>d\19signature_help\r<space>H\nhover\bbuf\blsp\r<space>h\14goto_next\a]l\14goto_prev\a[l\14setqflist\14<space>lq\15open_float\15diagnostic\14<space>ll\24:DiagWindowShow<CR>\r<space>L\6n\bset\vkeymap\bvim\1\0\1\vsilent\2\21ensure_installed\1\0\0\1\4\0\0\rtsserver\18stylelint_lsp\vclangd\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\15\0005\4\f\0005\5\r\0=\5\14\4=\4\16\3=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\fautotag\1\0\1\venable\2\16textobjects\vselect\1\0\0\fkeymaps\1\0\3\aif\20@function.inner\aaf\20@function.outer\aip\21@parameter.inner\1\0\2\14lookahead\2\venable\2\26incremental_selection\1\0\1\venable\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\v\0\0\15typescript\btsx\15javascript\bcss\tscss\blua\rmarkdown\20markdown_inline\6c\bcpp\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\n%\0\2\3\0\1\0\0025\2\0\0L\2\2\0\1\3\0\0\15treesitter\vindent�\3\1\0\a\0\20\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\f\0'\4\r\0B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\14\0006\4\0\0'\6\1\0B\4\2\0029\4\15\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0006\4\0\0'\6\1\0B\4\2\0029\4\17\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\18\0006\4\0\0'\6\1\0B\4\2\0029\4\15\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0006\4\0\0'\6\1\0B\4\2\0029\4\17\4B\0\4\1K\0\1\0\azm\azr\18closeAllFolds\azM\17openAllFolds\azR\azo\t<CR>\azc\t<BS>\6n\bset\vkeymap\bvim\22provider_selector\1\0\1\30enable_get_fold_virt_text\2\0\nsetup\bufo\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["root-climber.nvim"] = {
    config = { "\27LJ\2\n=\0\1\4\0\2\0\n\v\0\0\0X\1\4�6\1\0\0'\3\1\0B\1\2\1X\1\3�6\1\0\0\18\3\0\0B\1\2\1K\0\1\0\fnothing\nprintF\1\1\5\0\5\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0003\4\4\0B\1\3\1K\0\1\0\0\targs\brun\17root-climber\frequire=\0\1\4\0\2\0\n\v\0\0\0X\1\4�6\1\0\0'\3\1\0B\1\2\1X\1\3�6\1\0\0\18\3\0\0B\1\2\1K\0\1\0\fnothing\nprintJ\1\1\5\0\5\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0003\4\4\0B\1\3\1K\0\1\0\0\targs\ffzf_run\17root-climber\frequire�\1\1\0\5\0\v\0\0196\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0003\3\6\0005\4\a\0B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\b\0003\3\t\0005\4\n\0B\0\4\1K\0\1\0\1\0\1\nnargs\3\1\0\23FzfTestRootClimber\1\0\1\nnargs\3\1\0\20TestRootClimber\29nvim_create_user_command\bapi root_climber#always_confirm\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/root-climber.nvim",
    url = "https://github.com/ziimir/root-climber.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  treesj = {
    config = { "\27LJ\2\n�\6\0\0\v\0*\0^6\0\0\0'\2\1\0B\0\2\0025\1\3\0005\2\2\0=\2\4\0015\2\5\0=\2\6\0015\2\b\0009\3\a\0\18\5\1\0B\3\2\2=\3\t\0029\3\a\0\18\5\1\0B\3\2\2=\3\n\0029\3\v\0\18\5\1\0B\3\2\2=\3\f\0025\3\r\0009\4\a\0\18\6\1\0B\4\2\2=\4\t\0039\4\a\0\18\6\1\0B\4\2\2=\4\n\0039\4\v\0\18\6\1\0B\4\2\2=\4\f\0039\4\a\0\18\6\1\0B\4\2\2=\4\14\0039\4\a\0\18\6\1\0B\4\2\2=\4\15\0039\4\16\0005\6\18\0005\a\17\0=\a\4\6B\4\2\2=\4\19\0039\4\16\0005\6\21\0005\a\20\0=\a\4\6B\4\2\2=\4\22\0039\4\a\0005\6\24\0005\a\23\0=\a\25\0065\a\26\0=\a\6\6B\4\2\2=\4\27\0036\4\0\0'\6\28\0B\4\2\0029\4\29\0045\6\30\0005\a\31\0=\2 \a=\3!\a=\3\"\a=\a#\6B\4\2\0016\4$\0009\4%\0049\4&\4'\6'\0'\a(\0006\b\0\0'\n\28\0B\b\2\0029\b\6\bB\4\4\0016\4$\0009\4%\0049\4&\4'\6'\0'\a)\0006\b\0\0'\n\28\0B\b\2\0029\b\4\bB\4\4\1K\0\1\0\agS\agJ\6n\bset\vkeymap\bvim\nlangs\btsx\15typescript\15javascript\1\0\0\1\0\2\23check_syntax_error\1\24use_default_keymaps\1\nsetup\vtreesj\16object_type\1\0\1\22space_in_brackets\1\tboth\1\0\0\1\0\2\19last_separator\2\14separator\6;\19type_arguments\1\0\0\1\0\1\19last_separator\1\20type_parameters\1\0\0\1\0\1\19last_separator\1\24set_preset_for_args\14enum_body\15tuple_type\1\0\0\narray\24set_preset_for_list\vobject\18named_imports\1\0\0\24set_preset_for_dict\tjoin\1\0\2\19last_separator\1\22space_in_brackets\1\nsplit\1\0\0\1\0\1\19last_separator\1\23treesj.langs.utils\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/treesj",
    url = "https://github.com/Wansmer/treesj"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\n�\b\0\0\3\0 \0M6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0009\0\b\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0'\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\f\0=\1\r\0006\0\0\0009\0\1\0'\1\15\0=\1\14\0006\0\0\0009\0\1\0'\1\17\0=\1\16\0006\0\0\0009\0\1\0)\1\1\0=\1\18\0006\0\0\0009\0\1\0'\1\20\0=\1\19\0006\0\0\0009\0\1\0'\1\22\0=\1\21\0006\0\0\0009\0\1\0)\1\0\0=\1\23\0006\0\0\0009\0\1\0)\1\0\0=\1\24\0006\0\0\0009\0\1\0'\1\f\0=\1\25\0006\0\0\0009\0\1\0)\1\0\0=\1\26\0006\0\0\0009\0\1\0'\1\28\0=\1\27\0006\0\0\0009\0\1\0)\1\0\0=\1\29\0006\0\0\0009\0\1\0)\1\0\0=\1\30\0006\0\0\0009\0\1\0)\1\0\0=\1\31\0K\0\1\0+airline#extensions#tabline#show_tab_nr-airline#extensions#tabline#show_tab_type+airline#extensions#tabline#show_splits\a:t(airline#extensions#tabline#fnamemod1airline#extensions#tabline#show_close_button*airline#extensions#tabline#tabs_label,airline#extensions#tabline#show_buffers1airline#extensions#nvimlsp#show_line_numbers\t .airline#extensions#nvimlsp#warning_symbol\t ,airline#extensions#nvimlsp#error_symbol'airline#extensions#nvimlsp#enabled\16utf-8[unix]-airline#parts#ffenc#skip_expected_string\15%c:%l %p%%\22airline_section_z\22airline_section_x\5\22airline_section_b\b\rreadonly\20airline_symbolsv            if !exists('g:airline_symbols')\n                let g:airline_symbols = {}\n            endif\n        \bcmd\bsol\18airline_theme\1\5\0\0\ftabline\rquickfix\bfzf\fnvimlsp\23airline_extensions\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-airline",
    url = "https://github.com/vim-airline/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-airline-themes",
    url = "https://github.com/vim-airline/vim-airline-themes"
  },
  ["vim-autoread"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-autoread",
    url = "https://github.com/djoshea/vim-autoread"
  },
  ["vim-easyclip"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-easyclip",
    url = "https://github.com/svermeulen/vim-easyclip"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n�\a\0\0\6\0$\1W6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0*\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\r\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\16\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\30\0'\4\31\0005\5 \0B\0\5\0016\0!\0'\2\"\0B\0\2\0016\0!\0'\2#\0B\0\2\1K\0\1\0\28hi Floaterm guifg=white\28hi Floaterm guibg=black\bcmd\1\0\2\vsilent\2\fnoremap\2 <C-\\><C-n>:FloatermNext<CR>\v<c-s>]\1\0\2\vsilent\2\fnoremap\2 <C-\\><C-n>:FloatermPrev<CR>\v<c-s>[\1\0\2\vsilent\2\fnoremap\2 <C-\\><C-n>:FloatermKill<CR>\1\0\2\vsilent\2\fnoremap\2\"<C-\\><C-n>:FloatermToggle<CR>\1\0\2\vsilent\2\fnoremap\2\15<C-\\><C-n>\n<Esc>\6t\1\0\2\vsilent\2\fnoremap\2\22:FloatermKill<CR>\v<c-s>q\1\0\2\vsilent\2\fnoremap\2\24:FloatermToggle<CR>\v<c-s>s\1\0\2\vsilent\2\fnoremap\2\21:FloatermNew<CR>\v<c-s>n\6n\20nvim_set_keymap\bapi\vcenter\22floaterm_position\20floaterm_height\19floaterm_width\23floaterm_autoclose\6g\bvim����\25̙��\3\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0<autocmd BufReadPost /^fugitive://* set bufhidden=delete:autocmd BufReadPost fugitive://* set bufhidden=delete\bcmd\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "\27LJ\2\n�\3\0\0\6\0\19\0)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\a\0=\1\b\0006\0\0\0009\0\1\0'\1\5\0=\1\t\0006\0\0\0009\0\n\0)\1d\0=\1\v\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\17\0'\4\18\0004\5\0\0B\0\5\1K\0\1\0\30<Plug>(GitGutterPrevHunk)\a[h\30<Plug>(GitGutterNextHunk)\a]h\6n\bset\vkeymap\15updatetime\bopt$gitgutter_sign_modified_removed&gitgutter_sign_removed_first_line\b\27gitgutter_sign_removed\b\28gitgutter_sign_modified\b\25gitgutter_sign_added\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-highlightedyank"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\5\0\b6\0\0\0009\0\1\0)\1,\1=\1\2\0006\0\3\0'\2\4\0B\0\2\1K\0\1\0002highlight HighlightedyankRegion guibg=#D2DFE7\bcmd'highlightedyank_highlight_duration\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
  },
  ["vim-qf"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-qf",
    url = "https://github.com/romainl/vim-qf"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-sonictemplate"] = {
    config = { "\27LJ\2\nc\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0#~/.config/nvim/sonic_templates#sonictemplate_vim_template_dir\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-sonictemplate",
    url = "https://github.com/mattn/vim-sonictemplate"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\nd\0\1\a\1\6\0\v6\1\0\0009\1\1\0019\1\2\1'\3\3\0\18\4\0\0'\5\4\0-\6\0\0009\6\5\6&\3\6\3B\1\2\1K\0\1\0\0�\targs\6 \23TestFile --config \17nvim_command\bapi\bvimZ\1\1\5\0\5\0\t6\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\3\0003\4\4\0B\1\3\0012\0\0�K\0\1\0\0\21*.jest.config.js\ffzf_run\17root-climber\frequire�\1\0\1\a\1\b\0\0156\1\0\0009\1\1\0019\1\2\1'\3\3\0\18\4\0\0'\5\4\0-\6\0\0009\6\5\6&\3\6\3B\1\2\0016\1\0\0009\1\6\1'\3\a\0B\1\2\1K\0\1\0\0�,unlet g:test#javascript#jest#executable\bcmd\targs\6 \23TestFile --config \17nvim_command\bapi\bvim�\1\1\1\5\0\t\0\r6\1\0\0009\1\1\1'\2\3\0=\2\2\0016\1\4\0'\3\5\0B\1\2\0029\1\6\1'\3\a\0003\4\b\0B\1\3\0012\0\0�K\0\1\0\0\21*.jest.config.js\ffzf_run\17root-climber\frequire.node --inspect-brk node_modules/.bin/jest$test#javascript#jest#executable\6g\bvim�\1\0\1\4\0\a\0\v6\1\0\0009\1\1\1'\2\3\0009\3\4\0&\2\3\2=\2\2\0016\1\0\0009\1\5\1'\3\6\0B\1\2\1K\0\1\0R          TestFile\n          unlet g:test#javascript#jest#executable\n        \bcmd\targs/node --inspect-brk node_modules/.bin/jest $test#javascript#jest#executable\6g\bvim�\4\1\0\5\0\23\0*6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0003\3\15\0005\4\16\0B\0\4\0016\0\0\0009\0\f\0009\0\r\0'\2\17\0003\3\18\0005\4\19\0B\0\4\0016\0\0\0009\0\f\0009\0\r\0'\2\20\0003\3\21\0005\4\22\0B\0\4\1K\0\1\0\1\0\1\nnargs\6*\0\14DebugFile\1\0\1\nnargs\6*\0\fJestBrk\1\0\1\nnargs\6*\0\tJest\29nvim_create_user_command\bapi%\\v^spec/.*spec\\.(js|jsx|ts|tsx)$)test#javascript#jasmine#file_pattern$\\v(test|spec)\\.(js|jsx|ts|tsx)$'test#javascript#karma#file_pattern3\\v(__tests__/.*|(spec|test))\\.(js|jsx|ts|tsx)$&test#javascript#jest#file_pattern+\\v(tests?/.*|(test))\\.(js|jsx|ts|tsx)$'test#javascript#mocha#file_pattern\rfloaterm\18test#strategy\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  winresizer = {
    config = { "\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\14<leader>e\25winresizer_start_key\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/winresizer",
    url = "https://github.com/simeji/winresizer"
  },
  ["yank-code"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/yank-code",
    url = "https://github.com/AaronLasseigne/yank-code"
  },
  ["zenbones.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme zenbones\25set background=light\bcmd\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/zenbones.nvim",
    url = "https://github.com/mcchrish/zenbones.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: treesj
time([[Config for treesj]], true)
try_loadstring("\27LJ\2\n�\6\0\0\v\0*\0^6\0\0\0'\2\1\0B\0\2\0025\1\3\0005\2\2\0=\2\4\0015\2\5\0=\2\6\0015\2\b\0009\3\a\0\18\5\1\0B\3\2\2=\3\t\0029\3\a\0\18\5\1\0B\3\2\2=\3\n\0029\3\v\0\18\5\1\0B\3\2\2=\3\f\0025\3\r\0009\4\a\0\18\6\1\0B\4\2\2=\4\t\0039\4\a\0\18\6\1\0B\4\2\2=\4\n\0039\4\v\0\18\6\1\0B\4\2\2=\4\f\0039\4\a\0\18\6\1\0B\4\2\2=\4\14\0039\4\a\0\18\6\1\0B\4\2\2=\4\15\0039\4\16\0005\6\18\0005\a\17\0=\a\4\6B\4\2\2=\4\19\0039\4\16\0005\6\21\0005\a\20\0=\a\4\6B\4\2\2=\4\22\0039\4\a\0005\6\24\0005\a\23\0=\a\25\0065\a\26\0=\a\6\6B\4\2\2=\4\27\0036\4\0\0'\6\28\0B\4\2\0029\4\29\0045\6\30\0005\a\31\0=\2 \a=\3!\a=\3\"\a=\a#\6B\4\2\0016\4$\0009\4%\0049\4&\4'\6'\0'\a(\0006\b\0\0'\n\28\0B\b\2\0029\b\6\bB\4\4\0016\4$\0009\4%\0049\4&\4'\6'\0'\a)\0006\b\0\0'\n\28\0B\b\2\0029\b\4\bB\4\4\1K\0\1\0\agS\agJ\6n\bset\vkeymap\bvim\nlangs\btsx\15typescript\15javascript\1\0\0\1\0\2\23check_syntax_error\1\24use_default_keymaps\1\nsetup\vtreesj\16object_type\1\0\1\22space_in_brackets\1\tboth\1\0\0\1\0\2\19last_separator\2\14separator\6;\19type_arguments\1\0\0\1\0\1\19last_separator\1\20type_parameters\1\0\0\1\0\1\19last_separator\1\24set_preset_for_args\14enum_body\15tuple_type\1\0\0\narray\24set_preset_for_list\vobject\18named_imports\1\0\0\24set_preset_for_dict\tjoin\1\0\2\19last_separator\1\22space_in_brackets\1\nsplit\1\0\0\1\0\1\19last_separator\1\23treesj.langs.utils\frequire\0", "config", "treesj")
time([[Config for treesj]], false)
-- Config for: ack.vim
time([[Config for ack.vim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\16\0!6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0016\0\4\0'\2\6\0B\0\2\0016\0\4\0'\2\a\0B\0\2\0016\0\4\0'\2\b\0B\0\2\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\f\0'\4\r\0004\5\0\0B\0\5\0016\0\0\0009\0\t\0009\0\n\0'\2\v\0'\3\14\0'\4\15\0004\5\0\0B\0\5\1K\0\1\0!:Ack<Space>\"\\b<cword>\\b\"<CR>\14<Leader>G\16:Ack<Space>\14<Leader>g\6n\20nvim_set_keymap\bapi!cnoreabbrev LAckAdd LAckAdd!\27cnoreabbrev LAck LAck!\31cnoreabbrev AckAdd AckAdd!\25cnoreabbrev Ack Ack!\bcmd\17ag --vimgrep\vackprg\6g\bvim\0", "config", "ack.vim")
time([[Config for ack.vim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\14lightbulb\1\0\1\venable\1\21symbol_in_winbar\1\0\1\venable\1\19scroll_preview\1\0\2\16scroll_down\n<C-d>\14scroll_up\n<C-u>\15definition\1\0\2\vheight\3\1\nwidth\3\1\vfinder\1\0\0\1\0\4\16right_width\4��̙\3���\3\15left_width\4����\t����\3\15max_height\4͙��\f̙��\3\vlayout\vnormal\nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: asyncrun.vim
time([[Config for asyncrun.vim]], true)
try_loadstring("\27LJ\2\n/\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\19\0=\1\2\0K\0\1\0\18asyncrun_open\6g\bvim\0", "config", "asyncrun.vim")
time([[Config for asyncrun.vim]], false)
-- Config for: vim-gitgutter
time([[Config for vim-gitgutter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\19\0)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\a\0=\1\b\0006\0\0\0009\0\1\0'\1\5\0=\1\t\0006\0\0\0009\0\n\0)\1d\0=\1\v\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\17\0'\4\18\0004\5\0\0B\0\5\1K\0\1\0\30<Plug>(GitGutterPrevHunk)\a[h\30<Plug>(GitGutterNextHunk)\a]h\6n\bset\vkeymap\15updatetime\bopt$gitgutter_sign_modified_removed&gitgutter_sign_removed_first_line\b\27gitgutter_sign_removed\b\28gitgutter_sign_modified\b\25gitgutter_sign_added\6g\bvim\0", "config", "vim-gitgutter")
time([[Config for vim-gitgutter]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0009\0\1\0'\2\2\0B\0\2\2'\1\3\0&\0\1\0L\0\2\0\30/.config/nvim/cspell.json\tHOME\vgetenv\aos�\2\1\0\b\0\21\0,6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\5\0009\3\3\0009\3\4\3=\3\6\0023\3\a\0=\3\b\0024\3\5\0009\4\t\0019\4\n\0045\6\v\0=\2\f\6B\4\2\2>\4\1\0039\4\r\0019\4\n\0045\6\14\0=\2\f\6B\4\2\2>\4\2\0039\4\15\0009\4\t\0049\4\16\0049\4\n\0045\6\17\0009\a\3\0009\a\4\a=\a\6\6B\4\2\2>\4\3\0039\4\15\0009\4\r\0049\4\16\4>\4\4\0039\4\18\0005\6\19\0=\3\20\6B\4\2\1K\0\1\0\fsources\1\0\0\nsetup\1\0\0\reslint_d\rbuiltins\1\0\0\17code_actions\vconfig\1\0\0\twith\16diagnostics\14find_json\0\vmethod\1\0\0\24DIAGNOSTICS_ON_SAVE\fmethods\vcspell\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: vim-sonictemplate
time([[Config for vim-sonictemplate]], true)
try_loadstring("\27LJ\2\nc\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0#~/.config/nvim/sonic_templates#sonictemplate_vim_template_dir\6g\bvim\0", "config", "vim-sonictemplate")
time([[Config for vim-sonictemplate]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\2\0\0\n\0\22\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\17\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\a)\t��B\a\2\2=\a\b\0069\a\3\0009\a\6\a)\t\4\0B\a\2\2=\a\t\0069\a\3\0009\a\n\aB\a\1\2=\a\v\0069\a\3\0009\a\f\aB\a\1\2=\a\r\0069\a\3\0009\a\14\a5\t\15\0B\a\2\2=\a\16\6B\4\2\2=\4\3\0034\4\4\0005\5\18\0>\5\1\0045\5\19\0>\5\2\0045\5\20\0>\5\3\4=\4\21\3B\1\2\1K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\1\0\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-g>\nabort\n<C-l>\rcomplete\n<C-d>\n<C-u>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: clever-f.vim
time([[Config for clever-f.vim]], true)
try_loadstring("\27LJ\2\n]\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\24clever_f_smart_case\28clever_f_across_no_line\6g\bvim\0", "config", "clever-f.vim")
time([[Config for clever-f.vim]], false)
-- Config for: root-climber.nvim
time([[Config for root-climber.nvim]], true)
try_loadstring("\27LJ\2\n=\0\1\4\0\2\0\n\v\0\0\0X\1\4�6\1\0\0'\3\1\0B\1\2\1X\1\3�6\1\0\0\18\3\0\0B\1\2\1K\0\1\0\fnothing\nprintF\1\1\5\0\5\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0003\4\4\0B\1\3\1K\0\1\0\0\targs\brun\17root-climber\frequire=\0\1\4\0\2\0\n\v\0\0\0X\1\4�6\1\0\0'\3\1\0B\1\2\1X\1\3�6\1\0\0\18\3\0\0B\1\2\1K\0\1\0\fnothing\nprintJ\1\1\5\0\5\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0003\4\4\0B\1\3\1K\0\1\0\0\targs\ffzf_run\17root-climber\frequire�\1\1\0\5\0\v\0\0196\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0003\3\6\0005\4\a\0B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\b\0003\3\t\0005\4\n\0B\0\4\1K\0\1\0\1\0\1\nnargs\3\1\0\23FzfTestRootClimber\1\0\1\nnargs\3\1\0\20TestRootClimber\29nvim_create_user_command\bapi root_climber#always_confirm\6g\bvim\0", "config", "root-climber.nvim")
time([[Config for root-climber.nvim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\nd\0\1\a\1\6\0\v6\1\0\0009\1\1\0019\1\2\1'\3\3\0\18\4\0\0'\5\4\0-\6\0\0009\6\5\6&\3\6\3B\1\2\1K\0\1\0\0�\targs\6 \23TestFile --config \17nvim_command\bapi\bvimZ\1\1\5\0\5\0\t6\1\0\0'\3\1\0B\1\2\0029\1\2\1'\3\3\0003\4\4\0B\1\3\0012\0\0�K\0\1\0\0\21*.jest.config.js\ffzf_run\17root-climber\frequire�\1\0\1\a\1\b\0\0156\1\0\0009\1\1\0019\1\2\1'\3\3\0\18\4\0\0'\5\4\0-\6\0\0009\6\5\6&\3\6\3B\1\2\0016\1\0\0009\1\6\1'\3\a\0B\1\2\1K\0\1\0\0�,unlet g:test#javascript#jest#executable\bcmd\targs\6 \23TestFile --config \17nvim_command\bapi\bvim�\1\1\1\5\0\t\0\r6\1\0\0009\1\1\1'\2\3\0=\2\2\0016\1\4\0'\3\5\0B\1\2\0029\1\6\1'\3\a\0003\4\b\0B\1\3\0012\0\0�K\0\1\0\0\21*.jest.config.js\ffzf_run\17root-climber\frequire.node --inspect-brk node_modules/.bin/jest$test#javascript#jest#executable\6g\bvim�\1\0\1\4\0\a\0\v6\1\0\0009\1\1\1'\2\3\0009\3\4\0&\2\3\2=\2\2\0016\1\0\0009\1\5\1'\3\6\0B\1\2\1K\0\1\0R          TestFile\n          unlet g:test#javascript#jest#executable\n        \bcmd\targs/node --inspect-brk node_modules/.bin/jest $test#javascript#jest#executable\6g\bvim�\4\1\0\5\0\23\0*6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0003\3\15\0005\4\16\0B\0\4\0016\0\0\0009\0\f\0009\0\r\0'\2\17\0003\3\18\0005\4\19\0B\0\4\0016\0\0\0009\0\f\0009\0\r\0'\2\20\0003\3\21\0005\4\22\0B\0\4\1K\0\1\0\1\0\1\nnargs\6*\0\14DebugFile\1\0\1\nnargs\6*\0\fJestBrk\1\0\1\nnargs\6*\0\tJest\29nvim_create_user_command\bapi%\\v^spec/.*spec\\.(js|jsx|ts|tsx)$)test#javascript#jasmine#file_pattern$\\v(test|spec)\\.(js|jsx|ts|tsx)$'test#javascript#karma#file_pattern3\\v(__tests__/.*|(spec|test))\\.(js|jsx|ts|tsx)$&test#javascript#jest#file_pattern+\\v(tests?/.*|(test))\\.(js|jsx|ts|tsx)$'test#javascript#mocha#file_pattern\rfloaterm\18test#strategy\6g\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0<autocmd BufReadPost /^fugitive://* set bufhidden=delete:autocmd BufReadPost fugitive://* set bufhidden=delete\bcmd\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\n�\a\0\0\6\0$\1W6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0*\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\r\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\16\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\30\0'\4\31\0005\5 \0B\0\5\0016\0!\0'\2\"\0B\0\2\0016\0!\0'\2#\0B\0\2\1K\0\1\0\28hi Floaterm guifg=white\28hi Floaterm guibg=black\bcmd\1\0\2\vsilent\2\fnoremap\2 <C-\\><C-n>:FloatermNext<CR>\v<c-s>]\1\0\2\vsilent\2\fnoremap\2 <C-\\><C-n>:FloatermPrev<CR>\v<c-s>[\1\0\2\vsilent\2\fnoremap\2 <C-\\><C-n>:FloatermKill<CR>\1\0\2\vsilent\2\fnoremap\2\"<C-\\><C-n>:FloatermToggle<CR>\1\0\2\vsilent\2\fnoremap\2\15<C-\\><C-n>\n<Esc>\6t\1\0\2\vsilent\2\fnoremap\2\22:FloatermKill<CR>\v<c-s>q\1\0\2\vsilent\2\fnoremap\2\24:FloatermToggle<CR>\v<c-s>s\1\0\2\vsilent\2\fnoremap\2\21:FloatermNew<CR>\v<c-s>n\6n\20nvim_set_keymap\bapi\vcenter\22floaterm_position\20floaterm_height\19floaterm_width\23floaterm_autoclose\6g\bvim����\25̙��\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\n%\0\2\3\0\1\0\0025\2\0\0L\2\2\0\1\3\0\0\15treesitter\vindent�\3\1\0\a\0\20\0?6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\f\0'\4\r\0B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\14\0006\4\0\0'\6\1\0B\4\2\0029\4\15\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0006\4\0\0'\6\1\0B\4\2\0029\4\17\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\18\0006\4\0\0'\6\1\0B\4\2\0029\4\15\4B\0\4\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\19\0006\4\0\0'\6\1\0B\4\2\0029\4\17\4B\0\4\1K\0\1\0\azm\azr\18closeAllFolds\azM\17openAllFolds\azR\azo\t<CR>\azc\t<BS>\6n\bset\vkeymap\bvim\22provider_selector\1\0\1\30enable_get_fold_virt_text\2\0\nsetup\bufo\frequire\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\n\0\0\a\0005\0�\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0015\0\a\0006\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\14\0006\5\b\0009\5\15\0059\5\16\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\17\0006\5\b\0009\5\15\0059\5\18\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\19\0006\5\b\0009\5\15\0059\5\20\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\21\0006\5\b\0009\5\15\0059\5\22\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\23\0006\5\b\0009\5\24\0059\5\25\0059\5\26\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\27\0006\5\b\0009\5\24\0059\5\25\0059\5\28\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\29\0006\5\b\0009\5\24\0059\5\25\0059\5\30\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4\31\0006\5\b\0009\5\24\0059\5\25\0059\5 \5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4!\0'\5\"\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4#\0'\5$\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4%\0'\5&\0\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\1'\3\v\0'\4'\0006\5\b\0009\5\24\0059\5\25\0059\5(\5\18\6\0\0B\1\5\0016\1\b\0009\1\t\0019\1\n\0015\3)\0'\4*\0006\5\b\0009\5\24\0059\5\25\0059\5+\5\18\6\0\0B\1\5\0016\1\0\0'\3,\0B\1\2\0029\2-\0019\2\2\0024\4\0\0B\2\2\0019\2.\0019\2\2\0024\4\0\0B\2\2\0019\2/\0019\2\2\0025\0043\0005\0051\0005\0060\0=\0062\5=\0054\4B\2\2\1K\0\1\0\rsettings\1\0\0\18stylelintplus\1\0\0\1\0\2\19validateOnSave\2\19validateOnType\1\18stylelint_lsp\vclangd\rtsserver\14lspconfig\16code_action\r<space>a\1\3\0\0\6n\6v\vrename\r<space>r :Lspsaga finder def+ref<CR>\r<space>*&:Lspsaga peek_type_definition<CR>\r<space>T!:Lspsaga peek_definition<CR>\r<space>D\20type_definition\r<space>t\15definition\r<space>d\19signature_help\r<space>H\nhover\bbuf\blsp\r<space>h\14goto_next\a]l\14goto_prev\a[l\14setqflist\14<space>lq\15open_float\15diagnostic\14<space>ll\24:DiagWindowShow<CR>\r<space>L\6n\bset\vkeymap\bvim\1\0\1\vsilent\2\21ensure_installed\1\0\0\1\4\0\0\rtsserver\18stylelint_lsp\vclangd\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\3\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\15\0005\4\f\0005\5\r\0=\5\14\4=\4\16\3=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\fautotag\1\0\1\venable\2\16textobjects\vselect\1\0\0\fkeymaps\1\0\3\aif\20@function.inner\aaf\20@function.outer\aip\21@parameter.inner\1\0\2\14lookahead\2\venable\2\26incremental_selection\1\0\1\venable\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\v\0\0\15typescript\btsx\15javascript\bcss\tscss\blua\rmarkdown\20markdown_inline\6c\bcpp\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nU\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\0\1\0\1\vcss_fn\2\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: neoformat
time([[Config for neoformat]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\6\0\f6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\4\0'\2\5\0B\0\2\1K\0\1\0Lautocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.css,*.html Neoformat\bcmd neoformat_only_msg_on_error\27neoformat_try_node_exe\6g\bvim\0", "config", "neoformat")
time([[Config for neoformat]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: winresizer
time([[Config for winresizer]], true)
try_loadstring("\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\14<leader>e\25winresizer_start_key\6g\bvim\0", "config", "winresizer")
time([[Config for winresizer]], false)
-- Config for: vim-highlightedyank
time([[Config for vim-highlightedyank]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\5\0\b6\0\0\0009\0\1\0)\1,\1=\1\2\0006\0\3\0'\2\4\0B\0\2\1K\0\1\0002highlight HighlightedyankRegion guibg=#D2DFE7\bcmd'highlightedyank_highlight_duration\6g\bvim\0", "config", "vim-highlightedyank")
time([[Config for vim-highlightedyank]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\15\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1<\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22:NERDTreeFind<CR>\n<C-\\>\1\0\1\fnoremap\2\24:NERDTreeToggle<CR>\14<leader>t\6n\20nvim_set_keymap\bapi\29NERDTreeAutoDeleteBuffer\20NERDTreeWinSize\23NERDTreeShowHidden\23NERDTreeQuitOnOpen\6g\bvim\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
-- Config for: vim-airline
time([[Config for vim-airline]], true)
try_loadstring("\27LJ\2\n�\b\0\0\3\0 \0M6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0009\0\b\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0'\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\f\0=\1\r\0006\0\0\0009\0\1\0'\1\15\0=\1\14\0006\0\0\0009\0\1\0'\1\17\0=\1\16\0006\0\0\0009\0\1\0)\1\1\0=\1\18\0006\0\0\0009\0\1\0'\1\20\0=\1\19\0006\0\0\0009\0\1\0'\1\22\0=\1\21\0006\0\0\0009\0\1\0)\1\0\0=\1\23\0006\0\0\0009\0\1\0)\1\0\0=\1\24\0006\0\0\0009\0\1\0'\1\f\0=\1\25\0006\0\0\0009\0\1\0)\1\0\0=\1\26\0006\0\0\0009\0\1\0'\1\28\0=\1\27\0006\0\0\0009\0\1\0)\1\0\0=\1\29\0006\0\0\0009\0\1\0)\1\0\0=\1\30\0006\0\0\0009\0\1\0)\1\0\0=\1\31\0K\0\1\0+airline#extensions#tabline#show_tab_nr-airline#extensions#tabline#show_tab_type+airline#extensions#tabline#show_splits\a:t(airline#extensions#tabline#fnamemod1airline#extensions#tabline#show_close_button*airline#extensions#tabline#tabs_label,airline#extensions#tabline#show_buffers1airline#extensions#nvimlsp#show_line_numbers\t .airline#extensions#nvimlsp#warning_symbol\t ,airline#extensions#nvimlsp#error_symbol'airline#extensions#nvimlsp#enabled\16utf-8[unix]-airline#parts#ffenc#skip_expected_string\15%c:%l %p%%\22airline_section_z\22airline_section_x\5\22airline_section_b\b\rreadonly\20airline_symbolsv            if !exists('g:airline_symbols')\n                let g:airline_symbols = {}\n            endif\n        \bcmd\bsol\18airline_theme\1\5\0\0\ftabline\rquickfix\bfzf\fnvimlsp\23airline_extensions\6g\bvim\0", "config", "vim-airline")
time([[Config for vim-airline]], false)
-- Config for: editorconfig-vim
time([[Config for editorconfig-vim]], true)
try_loadstring('\27LJ\2\nZ\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0', "config", "editorconfig-vim")
time([[Config for editorconfig-vim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n�\1\0\0\b\1\t\0\26-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\6�6\0\1\0009\0\2\0009\0\3\0'\2\4\0B\0\2\1X\0\14�6\0\1\0009\0\2\0009\0\5\0006\2\1\0009\2\2\0029\2\6\2'\4\a\0+\5\2\0+\6\2\0+\a\2\0B\2\5\2'\3\b\0+\4\2\0B\0\4\1K\0\1\0\0�\6n\n<Tab>\27nvim_replace_termcodes\18nvim_feedkeys!<Plug>luasnip-expand-snippet\15nvim_input\bapi\bvim\15expandableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\4�-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0�\tjump\rjumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2��B\0\2\2\15\0\0\0X\1\4�-\0\0\0009\0\1\0)\2��B\0\2\1K\0\1\0\0�\tjump\rjumpable�\1\1\0\a\0\15\0\0296\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0003\5\a\0005\6\b\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\t\0003\5\n\0005\6\v\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0003\5\r\0005\6\14\0B\1\5\0012\0\0�K\0\1\0\1\0\1\vsilent\2\0\n<C-k>\1\0\1\vsilent\2\0\n<C-j>\1\0\1\vsilent\2\0\n<Tab>\6i\bset\vkeymap\bvim\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\v\0\f\0\0206\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0005\4\n\0'\5\6\0006\6\a\0009\6\b\6\18\b\0\0'\t\t\0'\n\5\0B\6\4\2&\5\6\5=\5\v\4D\1\3\0\foptions\1\0\0\f%.?%.%/\tgsub\vstring\r--query \5\18fzf#vim#files\f<cfile>\vexpand\afn\bvim�\4\1\0\6\0\28\00016\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\6\0'\1\b\0=\1\a\0006\0\0\0009\0\6\0'\1\n\0=\1\t\0006\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\0\0009\0\23\0009\0\24\0'\2\r\0'\3\25\0003\4\26\0005\5\27\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\0\15<Leader>fp\bset\vkeymap\1\0\1\fnoremap\2\17:GFiles?<CR>\15<Leader>f.\1\0\1\fnoremap\2\16:GFiles<CR>\15<Leader>ff\1\0\1\fnoremap\2&:call fzf#sonictemplate#run()<CR>\15<Leader>st\6n\20nvim_set_keymap\bapi\vGitHub\14BAT_THEMEL--bind ctrl-e:preview-half-page-down --bind ctrl-y:preview-half-page-up\21FZF_DEFAULT_OPTS\benv\1\0\1\tdown\t100%\15fzf_layout\1\3\0\0\vup:50%\vctrl-t\23fzf_preview_window\6g\bvim\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: zenbones.nvim
time([[Config for zenbones.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme zenbones\25set background=light\bcmd\0", "config", "zenbones.nvim")
time([[Config for zenbones.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType qf ++once lua require("packer.load")({'nvim-bqf'}, { ft = "qf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
