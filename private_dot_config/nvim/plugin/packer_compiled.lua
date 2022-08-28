-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

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

  _G._packer = _G._packer or {}
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
    config = { "\27LJ\2\nŸ\1\0\0\b\1\t\0\26-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\6Ä6\0\1\0009\0\2\0009\0\3\0'\2\4\0B\0\2\1X\0\14Ä6\0\1\0009\0\2\0009\0\5\0006\2\1\0009\2\2\0029\2\6\2'\4\a\0+\5\2\0+\6\2\0+\a\2\0B\2\5\2'\3\b\0+\4\2\0B\0\4\1K\0\1\0\0¿\6n\n<Tab>\27nvim_replace_termcodes\18nvim_feedkeys!<Plug>luasnip-expand-snippet\15nvim_input\bapi\bvim\15expandableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0¿\tjump\rjumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2ˇˇB\0\2\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2ˇˇB\0\2\1K\0\1\0\0¿\tjump\rjumpable“\1\1\0\a\0\15\0\0296\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0003\5\a\0005\6\b\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\t\0003\5\n\0005\6\v\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0003\5\r\0005\6\14\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\vsilent\2\0\n<C-k>\1\0\1\vsilent\2\0\n<C-j>\1\0\1\vsilent\2\0\n<Tab>\6i\bset\vkeymap\bvim\fluasnip\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  QFEnter = {
    config = { "\27LJ\2\në\1\0\0\3\0\f\0\r6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\1=\1\2\0K\0\1\0\ntopen\1\2\0\0\n<C-t>\nhopen\1\2\0\0\n<C-x>\nvopen\1\2\0\0\n<C-v>\topen\1\0\0\1\2\0\0\t<CR>\19qfenter_keymap\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/QFEnter",
    url = "https://github.com/yssl/QFEnter"
  },
  ["ack.vim"] = {
    config = { "\27LJ\2\nõ\2\0\0\6\0\15\0\0286\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\r\0'\4\14\0004\5\0\0B\0\5\1K\0\1\0!:Ack<Space>\"\\b<cword>\\b\"<CR>\14<Leader>G\16:Ack<Space>\14<Leader>g\6n\20nvim_set_keymap\bapi\25cnoreabbrev Ack Ack!\bcmd\21Trouble quickfix\17ack_qhandler\17ag --vimgrep\vackprg\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/ack.vim",
    url = "https://github.com/mileszs/ack.vim"
  },
  ale = {
    config = { "\27LJ\2\nü\6\0\0\6\0%\0Q6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0006\0\0\0009\0\1\0005\1\n\0005\2\t\0=\2\v\0015\2\f\0=\2\r\0015\2\14\0=\2\15\0015\2\16\0=\2\17\1=\1\b\0006\0\0\0009\0\1\0005\1\20\0005\2\19\0=\2\v\0015\2\21\0=\2\r\0015\2\22\0=\2\15\0015\2\23\0=\2\17\1=\1\18\0006\0\0\0009\0\24\0009\0\25\0'\2\26\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\24\0009\0\25\0'\2\26\0'\3\30\0'\4\31\0005\5 \0B\0\5\0016\0\0\0009\0\24\0009\0\25\0'\2\26\0'\3!\0'\4\"\0004\5\0\0B\0\5\0016\0\0\0009\0\24\0009\0\25\0'\2\26\0'\3#\0'\4$\0004\5\0\0B\0\5\1K\0\1\0\25<Plug>(ale_previous)\a[l\21<Plug>(ale_next)\a]l\1\0\1\vsilent\2\21<Plug>(ale_lint)\r<space>L\1\0\1\vsilent\2\23<Plug>(ale_detail)\r<space>l\6n\20nvim_set_keymap\bapi\1\2\0\0\veslint\1\2\0\0\veslint\1\2\0\0\veslint\1\0\0\1\2\0\0\veslint\15ale_fixers\20typescriptreact\1\3\0\0\veslint\rtsserver\15typescript\1\3\0\0\veslint\rtsserver\20javascriptreact\1\2\0\0\veslint\15javascript\1\0\0\1\2\0\0\veslint\16ale_linters\21ale_hover_cursor\21ale_lint_on_save\22ale_lint_on_enter!ale_lint_on_filetype_changed\29ale_lint_on_insert_leave\29ale_lint_on_text_changed\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
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
  ["coc.nvim"] = {
    config = { "\27LJ\2\n±\a\0\0\a\0 \0Y6\0\0\0009\0\1\0005\1\3\0=\1\2\0005\0\4\0006\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0'\5\15\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\16\0'\5\17\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\18\0'\5\19\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0'\5\21\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\22\0'\5\23\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\24\0'\5\25\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\26\0'\4\27\0'\5\28\0005\6\29\0B\1\5\0016\1\30\0'\3\31\0B\1\2\1K\0\1\0\26setlocal shortmess+=c\bcmd\1\0\3\vsilent\2\texpr\2\fnoremap\2\18coc#refresh()\n<c-l>\6i <Plug>(coc-codeaction-line)\r<space>a\27<Plug>(coc-codeaction)\r<space>A\23<Plug>(coc-rename)\r<space>r\27<Plug>(coc-references)\r<space>*::call CocAction('jumpTypeDefinition', 'tab drop')<CR>\r<space>T6:call CocAction('jumpTypeDefinition', 'edit')<CR>\r<space>t6:call CocAction('jumpDefinition', 'tab drop')<CR>\r<space>D2:call CocAction('jumpDefinition', 'edit')<CR>\r<space>d#:call CocAction('doHover')<CR>\r<space>h\6n\bset\vkeymap\1\0\1\vsilent\2\1\4\0\0\17coc-tsserver\22coc-spell-checker\20coc-sumneko-lua\26coc_global_extensions\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
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
  fzf = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/fzf",
    url = "/usr/local/opt/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n§\1\0\0\v\0\f\0\0206\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0005\4\n\0'\5\6\0006\6\a\0009\6\b\6\18\b\0\0'\t\t\0'\n\5\0B\6\4\2&\5\6\5=\5\v\4D\1\3\0\foptions\1\0\0\f%.?%.%/\tgsub\vstring\r--query \5\18fzf#vim#files\f<cfile>\vexpand\afn\bvimΩ\5\1\0\6\0\"\0A6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\6\0'\1\b\0=\1\a\0006\0\0\0009\0\6\0'\1\n\0=\1\t\0006\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\23\0'\4\24\0005\5\25\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\26\0'\4\27\0005\5\28\0B\0\5\0016\0\0\0009\0\29\0009\0\30\0'\2\r\0'\3\31\0003\4 \0005\5!\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\0\15<Leader>fp\bset\vkeymap\1\0\1\fnoremap\2\17:GFiles?<CR>\15<Leader>f.\1\0\1\fnoremap\2\16:GFiles<CR>\15<Leader>ff\1\0\1\fnoremap\2&:call fzf#sonictemplate#run()<CR>\15<Leader>st\1\0\1\fnoremap\2\17:Windows<CR>\15<Leader>ww\1\0\1\fnoremap\2\17:Buffers<CR>\15<Leader>bb\6n\20nvim_set_keymap\bapi\vGitHub\14BAT_THEMEL--bind ctrl-d:preview-half-page-down --bind ctrl-u:preview-half-page-up\21FZF_DEFAULT_OPTS\benv\1\0\1\tdown\t100%\15fzf_layout\1\3\0\0\vup:50%\vctrl-t\23fzf_preview_window\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["haskell-vim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/haskell-vim",
    url = "https://github.com/neovimhaskell/haskell-vim"
  },
  ["linediff.vim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/linediff.vim",
    url = "https://github.com/AndrewRadev/linediff.vim"
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
  nerdcommenter = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  nerdtree = {
    config = { "\27LJ\2\nƒ\2\0\0\6\0\15\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1<\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22:NERDTreeFind<CR>\n<C-\\>\1\0\1\fnoremap\2\24:NERDTreeToggle<CR>\14<leader>t\6n\20nvim_set_keymap\bapi\29NERDTreeAutoDeleteBuffer\20NERDTreeWinSize\23NERDTreeShowHidden\23NERDTreeQuitOnOpen\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nU\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\0\1\0\1\vcss_fn\2\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nî\3\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\15\0005\4\f\0005\5\r\0=\5\14\4=\4\16\3=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\fautotag\1\0\1\venable\2\16textobjects\vselect\1\0\0\fkeymaps\1\0\3\aif\20@function.inner\aaf\20@function.outer\aip\21@parameter.inner\1\0\2\14lookahead\2\venable\2\26incremental_selection\1\0\1\venable\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\a\0\0\15typescript\btsx\15javascript\bcss\tscss\blua\nsetup\28nvim-treesitter.configs\frequire\0" },
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
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
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
  ["root-climber.nvim"] = {
    config = { "\27LJ\2\n=\0\1\4\0\2\0\n\v\0\0\0X\1\4Ä6\1\0\0'\3\1\0B\1\2\1X\1\3Ä6\1\0\0\18\3\0\0B\1\2\1K\0\1\0\fnothing\nprintF\1\1\5\0\5\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0003\4\4\0B\1\3\1K\0\1\0\0\targs\brun\17root-climber\frequire=\0\1\4\0\2\0\n\v\0\0\0X\1\4Ä6\1\0\0'\3\1\0B\1\2\1X\1\3Ä6\1\0\0\18\3\0\0B\1\2\1K\0\1\0\fnothing\nprintJ\1\1\5\0\5\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0003\4\4\0B\1\3\1K\0\1\0\0\targs\ffzf_run\17root-climber\frequireÕ\1\1\0\5\0\v\0\0196\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0003\3\6\0005\4\a\0B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\b\0003\3\t\0005\4\n\0B\0\4\1K\0\1\0\1\0\1\nnargs\3\1\0\23FzfTestRootClimber\1\0\1\nnargs\3\1\0\20TestRootClimber\29nvim_create_user_command\bapi root_climber#always_confirm\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/root-climber.nvim",
    url = "https://github.com/ziimir/root-climber.nvim"
  },
  ["seoul256.vim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/seoul256.vim",
    url = "https://github.com/junegunn/seoul256.vim"
  },
  ["splitjoin.vim"] = {
    config = { '\27LJ\2\n}\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0"splitjoin_curly_brace_padding2splitjoin_html_attributes_bracket_on_new_line\6g\bvim\0' },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["telescope-coc.nvim"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/telescope-coc.nvim",
    url = "https://github.com/fannheyward/telescope-coc.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n–\2\0\0\5\0\r\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\v\0005\4\n\0=\4\5\3=\3\f\2B\0\2\1K\0\1\0\15extensions\1\0\0\1\0\2\21prefer_locations\2\22prefer_references\2\rdefaults\1\0\0\1\0\3\20layout_strategy\25bottom_pane_vertical\26dynamic_preview_title\2\18results_title\5\nsetup\bcoc\19load_extension\14telescope\25bottom_pane_vertical\29configs/telescope_layout\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\nÊ\3\0\0\b\0\21\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0005\3\b\0B\0\3\0026\1\4\0009\1\5\0019\1\t\0015\3\n\0005\4\v\0006\5\f\0=\5\r\4B\1\3\0016\1\4\0009\1\5\0019\1\t\1'\3\14\0005\4\15\0006\5\f\0=\5\r\4B\1\3\0015\1\16\0006\2\4\0009\2\5\0029\2\17\2'\4\18\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0\26:Trouble quickfix<CR>\r<space>q\6n\20nvim_set_keymap\1\0\2\vsilent\2\fnoremap\2\1\0\2\fcommand\17VimadeEnable\fpattern\fTrouble\rBufLeave\ngroup\25nodeCodeHelpersGroup\1\0\2\fcommand\18VimadeDisable\fpattern\fTrouble\1\3\0\0\rFileType\rBufEnter\24nvim_create_autocmd\1\0\1\nclear\2\26VimadeTroubleFixGroup\24nvim_create_augroup\bapi\bvim\1\0\1\tmode\rquickfix\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-airline"] = {
    config = { "\27LJ\2\nÒ\a\0\0\3\0\30\0E6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0009\0\b\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0'\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0006\0\0\0009\0\1\0'\1\16\0=\1\15\0006\0\0\0009\0\1\0)\1\0\0=\1\17\0006\0\0\0009\0\1\0'\1\19\0=\1\18\0006\0\0\0009\0\1\0'\1\21\0=\1\20\0006\0\0\0009\0\1\0)\1\0\0=\1\22\0006\0\0\0009\0\1\0'\1\f\0=\1\23\0006\0\0\0009\0\1\0)\1\0\0=\1\24\0006\0\0\0009\0\1\0'\1\26\0=\1\25\0006\0\0\0009\0\1\0)\1\0\0=\1\27\0006\0\0\0009\0\1\0)\1\0\0=\1\28\0006\0\0\0009\0\1\0)\1\0\0=\1\29\0K\0\1\0+airline#extensions#tabline#show_tab_nr-airline#extensions#tabline#show_tab_type+airline#extensions#tabline#show_splits\a:t(airline#extensions#tabline#fnamemod1airline#extensions#tabline#show_close_button*airline#extensions#tabline#tabs_label,airline#extensions#tabline#show_buffers\tÔÅ± *airline#extensions#ale#warning_symbol\tÔëÆ (airline#extensions#ale#error_symbol-airline#extensions#ale#show_line_numbers\16utf-8[unix]-airline#parts#ffenc#skip_expected_string\15%c:%l %p%%\22airline_section_z\5\22airline_section_x\bÓÇ¢\rreadonly\20airline_symbolsv            if !exists('g:airline_symbols')\n                let g:airline_symbols = {}\n            endif\n        \bcmd\bsol\18airline_theme\1\5\0\0\ftabline\rquickfix\bfzf\bale\23airline_extensions\6g\bvim\0" },
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
    config = { "\27LJ\2\ná\a\0\0\6\0$\1W6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0*\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\r\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\16\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\30\0'\4\31\0005\5 \0B\0\5\0016\0!\0'\2\"\0B\0\2\0016\0!\0'\2#\0B\0\2\1K\0\1\0\28hi Floaterm guifg=white\28hi Floaterm guibg=black\bcmd\1\0\2\fnoremap\2\vsilent\2 <C-\\><C-n>:FloatermNext<CR>\v<c-s>]\1\0\2\fnoremap\2\vsilent\2 <C-\\><C-n>:FloatermPrev<CR>\v<c-s>[\1\0\2\fnoremap\2\vsilent\2 <C-\\><C-n>:FloatermKill<CR>\1\0\2\fnoremap\2\vsilent\2\"<C-\\><C-n>:FloatermToggle<CR>\1\0\2\fnoremap\2\vsilent\2\15<C-\\><C-n>\n<Esc>\6t\1\0\2\fnoremap\2\vsilent\2\22:FloatermKill<CR>\v<c-s>q\1\0\2\fnoremap\2\vsilent\2\24:FloatermToggle<CR>\v<c-s>s\1\0\2\fnoremap\2\vsilent\2\21:FloatermNew<CR>\v<c-s>n\6n\20nvim_set_keymap\bapi\vcenter\22floaterm_position\20floaterm_height\19floaterm_width\23floaterm_autoclose\6g\bvimõ≥ÊÃ\25Ãô≥ˇ\3\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\nï\1\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0<autocmd BufReadPost /^fugitive://* set bufhidden=delete:autocmd BufReadPost fugitive://* set bufhidden=delete\bcmd\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gitgutter"] = {
    config = { "\27LJ\2\nô\3\0\0\6\0\19\0)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\a\0=\1\b\0006\0\0\0009\0\1\0'\1\5\0=\1\t\0006\0\0\0009\0\n\0)\1d\0=\1\v\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\17\0'\4\18\0004\5\0\0B\0\5\1K\0\1\0\30<Plug>(GitGutterPrevHunk)\a[h\30<Plug>(GitGutterNextHunk)\a]h\6n\bset\vkeymap\15updatetime\bopt$gitgutter_sign_modified_removed&gitgutter_sign_removed_first_line\bÔëò\27gitgutter_sign_removed\bÔëô\28gitgutter_sign_modified\bÔëó\25gitgutter_sign_added\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-highlightedyank"] = {
    config = { "\27LJ\2\nÇ\1\0\0\3\0\5\0\b6\0\0\0009\0\1\0)\1,\1=\1\2\0006\0\3\0'\2\4\0B\0\2\1K\0\1\0002highlight HighlightedyankRegion guibg=#D2DFE7\bcmd'highlightedyank_highlight_duration\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-highlightedyank",
    url = "https://github.com/machakann/vim-highlightedyank"
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
    config = { "\27LJ\2\nU\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\21~/.vim-templates#sonictemplate_vim_template_dir\6g\bvim\0" },
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vim-sonictemplate",
    url = "https://github.com/mattn/vim-sonictemplate"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\nO\0\1\5\0\4\0\b6\1\0\0009\1\1\0019\1\2\1'\3\3\0\18\4\0\0&\3\4\3B\1\2\1K\0\1\0\23TestFile --config \17nvim_command\bapi\bvimV\1\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0003\3\4\0B\0\3\1K\0\1\0\0\21*.jest.config.js\ffzf_run\17root-climber\frequireÊ\3\1\0\5\0\17\0\0286\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0003\3\15\0005\4\16\0B\0\4\1K\0\1\0\1\0\1\nnargs\3\0\0\tJest\29nvim_create_user_command\bapi%\\v^spec/.*spec\\.(js|jsx|ts|tsx)$)test#javascript#jasmine#file_pattern$\\v(test|spec)\\.(js|jsx|ts|tsx)$'test#javascript#karma#file_pattern3\\v(__tests__/.*|(spec|test))\\.(js|jsx|ts|tsx)$&test#javascript#jest#file_pattern+\\v(tests?/.*|(test))\\.(js|jsx|ts|tsx)$'test#javascript#mocha#file_pattern\rfloaterm\18test#strategy\6g\bvim\0" },
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
  vimade = {
    loaded = true,
    path = "/Users/ziimir/.local/share/nvim/site/pack/packer/start/vimade",
    url = "https://github.com/TaDaa/vimade"
  },
  winresizer = {
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
-- Config for: QFEnter
time([[Config for QFEnter]], true)
try_loadstring("\27LJ\2\në\1\0\0\3\0\f\0\r6\0\0\0009\0\1\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\1=\1\2\0K\0\1\0\ntopen\1\2\0\0\n<C-t>\nhopen\1\2\0\0\n<C-x>\nvopen\1\2\0\0\n<C-v>\topen\1\0\0\1\2\0\0\t<CR>\19qfenter_keymap\6g\bvim\0", "config", "QFEnter")
time([[Config for QFEnter]], false)
-- Config for: fzf.vim
time([[Config for fzf.vim]], true)
try_loadstring("\27LJ\2\n§\1\0\0\v\0\f\0\0206\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0005\4\n\0'\5\6\0006\6\a\0009\6\b\6\18\b\0\0'\t\t\0'\n\5\0B\6\4\2&\5\6\5=\5\v\4D\1\3\0\foptions\1\0\0\f%.?%.%/\tgsub\vstring\r--query \5\18fzf#vim#files\f<cfile>\vexpand\afn\bvimΩ\5\1\0\6\0\"\0A6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\6\0'\1\b\0=\1\a\0006\0\0\0009\0\6\0'\1\n\0=\1\t\0006\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0'\4\15\0005\5\16\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\17\0'\4\18\0005\5\19\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\23\0'\4\24\0005\5\25\0B\0\5\0016\0\0\0009\0\v\0009\0\f\0'\2\r\0'\3\26\0'\4\27\0005\5\28\0B\0\5\0016\0\0\0009\0\29\0009\0\30\0'\2\r\0'\3\31\0003\4 \0005\5!\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\0\15<Leader>fp\bset\vkeymap\1\0\1\fnoremap\2\17:GFiles?<CR>\15<Leader>f.\1\0\1\fnoremap\2\16:GFiles<CR>\15<Leader>ff\1\0\1\fnoremap\2&:call fzf#sonictemplate#run()<CR>\15<Leader>st\1\0\1\fnoremap\2\17:Windows<CR>\15<Leader>ww\1\0\1\fnoremap\2\17:Buffers<CR>\15<Leader>bb\6n\20nvim_set_keymap\bapi\vGitHub\14BAT_THEMEL--bind ctrl-d:preview-half-page-down --bind ctrl-u:preview-half-page-up\21FZF_DEFAULT_OPTS\benv\1\0\1\tdown\t100%\15fzf_layout\1\3\0\0\vup:50%\vctrl-t\23fzf_preview_window\6g\bvim\0", "config", "fzf.vim")
time([[Config for fzf.vim]], false)
-- Config for: vim-gitgutter
time([[Config for vim-gitgutter]], true)
try_loadstring("\27LJ\2\nô\3\0\0\6\0\19\0)6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\a\0=\1\b\0006\0\0\0009\0\1\0'\1\5\0=\1\t\0006\0\0\0009\0\n\0)\1d\0=\1\v\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\f\0009\0\r\0'\2\14\0'\3\17\0'\4\18\0004\5\0\0B\0\5\1K\0\1\0\30<Plug>(GitGutterPrevHunk)\a[h\30<Plug>(GitGutterNextHunk)\a]h\6n\bset\vkeymap\15updatetime\bopt$gitgutter_sign_modified_removed&gitgutter_sign_removed_first_line\bÔëò\27gitgutter_sign_removed\bÔëô\28gitgutter_sign_modified\bÔëó\25gitgutter_sign_added\6g\bvim\0", "config", "vim-gitgutter")
time([[Config for vim-gitgutter]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\nÊ\3\0\0\b\0\21\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0005\3\b\0B\0\3\0026\1\4\0009\1\5\0019\1\t\0015\3\n\0005\4\v\0006\5\f\0=\5\r\4B\1\3\0016\1\4\0009\1\5\0019\1\t\1'\3\14\0005\4\15\0006\5\f\0=\5\r\4B\1\3\0015\1\16\0006\2\4\0009\2\5\0029\2\17\2'\4\18\0'\5\19\0'\6\20\0\18\a\1\0B\2\5\1K\0\1\0\26:Trouble quickfix<CR>\r<space>q\6n\20nvim_set_keymap\1\0\2\vsilent\2\fnoremap\2\1\0\2\fcommand\17VimadeEnable\fpattern\fTrouble\rBufLeave\ngroup\25nodeCodeHelpersGroup\1\0\2\fcommand\18VimadeDisable\fpattern\fTrouble\1\3\0\0\rFileType\rBufEnter\24nvim_create_autocmd\1\0\1\nclear\2\26VimadeTroubleFixGroup\24nvim_create_augroup\bapi\bvim\1\0\1\tmode\rquickfix\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: vim-highlightedyank
time([[Config for vim-highlightedyank]], true)
try_loadstring("\27LJ\2\nÇ\1\0\0\3\0\5\0\b6\0\0\0009\0\1\0)\1,\1=\1\2\0006\0\3\0'\2\4\0B\0\2\1K\0\1\0002highlight HighlightedyankRegion guibg=#D2DFE7\bcmd'highlightedyank_highlight_duration\6g\bvim\0", "config", "vim-highlightedyank")
time([[Config for vim-highlightedyank]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\nO\0\1\5\0\4\0\b6\1\0\0009\1\1\0019\1\2\1'\3\3\0\18\4\0\0&\3\4\3B\1\2\1K\0\1\0\23TestFile --config \17nvim_command\bapi\bvimV\1\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0003\3\4\0B\0\3\1K\0\1\0\0\21*.jest.config.js\ffzf_run\17root-climber\frequireÊ\3\1\0\5\0\17\0\0286\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0'\1\v\0=\1\n\0006\0\0\0009\0\f\0009\0\r\0'\2\14\0003\3\15\0005\4\16\0B\0\4\1K\0\1\0\1\0\1\nnargs\3\0\0\tJest\29nvim_create_user_command\bapi%\\v^spec/.*spec\\.(js|jsx|ts|tsx)$)test#javascript#jasmine#file_pattern$\\v(test|spec)\\.(js|jsx|ts|tsx)$'test#javascript#karma#file_pattern3\\v(__tests__/.*|(spec|test))\\.(js|jsx|ts|tsx)$&test#javascript#jest#file_pattern+\\v(tests?/.*|(test))\\.(js|jsx|ts|tsx)$'test#javascript#mocha#file_pattern\rfloaterm\18test#strategy\6g\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: asyncrun.vim
time([[Config for asyncrun.vim]], true)
try_loadstring("\27LJ\2\n/\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\19\0=\1\2\0K\0\1\0\18asyncrun_open\6g\bvim\0", "config", "asyncrun.vim")
time([[Config for asyncrun.vim]], false)
-- Config for: vim-airline
time([[Config for vim-airline]], true)
try_loadstring("\27LJ\2\nÒ\a\0\0\3\0\30\0E6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0016\0\0\0009\0\1\0009\0\b\0'\1\n\0=\1\t\0006\0\0\0009\0\1\0'\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0006\0\0\0009\0\1\0'\1\16\0=\1\15\0006\0\0\0009\0\1\0)\1\0\0=\1\17\0006\0\0\0009\0\1\0'\1\19\0=\1\18\0006\0\0\0009\0\1\0'\1\21\0=\1\20\0006\0\0\0009\0\1\0)\1\0\0=\1\22\0006\0\0\0009\0\1\0'\1\f\0=\1\23\0006\0\0\0009\0\1\0)\1\0\0=\1\24\0006\0\0\0009\0\1\0'\1\26\0=\1\25\0006\0\0\0009\0\1\0)\1\0\0=\1\27\0006\0\0\0009\0\1\0)\1\0\0=\1\28\0006\0\0\0009\0\1\0)\1\0\0=\1\29\0K\0\1\0+airline#extensions#tabline#show_tab_nr-airline#extensions#tabline#show_tab_type+airline#extensions#tabline#show_splits\a:t(airline#extensions#tabline#fnamemod1airline#extensions#tabline#show_close_button*airline#extensions#tabline#tabs_label,airline#extensions#tabline#show_buffers\tÔÅ± *airline#extensions#ale#warning_symbol\tÔëÆ (airline#extensions#ale#error_symbol-airline#extensions#ale#show_line_numbers\16utf-8[unix]-airline#parts#ffenc#skip_expected_string\15%c:%l %p%%\22airline_section_z\5\22airline_section_x\bÓÇ¢\rreadonly\20airline_symbolsv            if !exists('g:airline_symbols')\n                let g:airline_symbols = {}\n            endif\n        \bcmd\bsol\18airline_theme\1\5\0\0\ftabline\rquickfix\bfzf\bale\23airline_extensions\6g\bvim\0", "config", "vim-airline")
time([[Config for vim-airline]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nî\3\0\0\6\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\15\0005\4\f\0005\5\r\0=\5\14\4=\4\16\3=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\fautotag\1\0\1\venable\2\16textobjects\vselect\1\0\0\fkeymaps\1\0\3\aif\20@function.inner\aaf\20@function.outer\aip\21@parameter.inner\1\0\2\14lookahead\2\venable\2\26incremental_selection\1\0\1\venable\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\a\0\0\15typescript\btsx\15javascript\bcss\tscss\blua\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: ack.vim
time([[Config for ack.vim]], true)
try_loadstring("\27LJ\2\nõ\2\0\0\6\0\15\0\0286\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\6\0'\2\a\0B\0\2\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\b\0009\0\t\0'\2\n\0'\3\r\0'\4\14\0004\5\0\0B\0\5\1K\0\1\0!:Ack<Space>\"\\b<cword>\\b\"<CR>\14<Leader>G\16:Ack<Space>\14<Leader>g\6n\20nvim_set_keymap\bapi\25cnoreabbrev Ack Ack!\bcmd\21Trouble quickfix\17ack_qhandler\17ag --vimgrep\vackprg\6g\bvim\0", "config", "ack.vim")
time([[Config for ack.vim]], false)
-- Config for: zenbones.nvim
time([[Config for zenbones.nvim]], true)
try_loadstring("\27LJ\2\nQ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\25colorscheme zenbones\25set background=light\bcmd\0", "config", "zenbones.nvim")
time([[Config for zenbones.nvim]], false)
-- Config for: ale
time([[Config for ale]], true)
try_loadstring("\27LJ\2\nü\6\0\0\6\0%\0Q6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0)\1\0\0=\1\4\0006\0\0\0009\0\1\0)\1\0\0=\1\5\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\0\0=\1\a\0006\0\0\0009\0\1\0005\1\n\0005\2\t\0=\2\v\0015\2\f\0=\2\r\0015\2\14\0=\2\15\0015\2\16\0=\2\17\1=\1\b\0006\0\0\0009\0\1\0005\1\20\0005\2\19\0=\2\v\0015\2\21\0=\2\r\0015\2\22\0=\2\15\0015\2\23\0=\2\17\1=\1\18\0006\0\0\0009\0\24\0009\0\25\0'\2\26\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\24\0009\0\25\0'\2\26\0'\3\30\0'\4\31\0005\5 \0B\0\5\0016\0\0\0009\0\24\0009\0\25\0'\2\26\0'\3!\0'\4\"\0004\5\0\0B\0\5\0016\0\0\0009\0\24\0009\0\25\0'\2\26\0'\3#\0'\4$\0004\5\0\0B\0\5\1K\0\1\0\25<Plug>(ale_previous)\a[l\21<Plug>(ale_next)\a]l\1\0\1\vsilent\2\21<Plug>(ale_lint)\r<space>L\1\0\1\vsilent\2\23<Plug>(ale_detail)\r<space>l\6n\20nvim_set_keymap\bapi\1\2\0\0\veslint\1\2\0\0\veslint\1\2\0\0\veslint\1\0\0\1\2\0\0\veslint\15ale_fixers\20typescriptreact\1\3\0\0\veslint\rtsserver\15typescript\1\3\0\0\veslint\rtsserver\20javascriptreact\1\2\0\0\veslint\15javascript\1\0\0\1\2\0\0\veslint\16ale_linters\21ale_hover_cursor\21ale_lint_on_save\22ale_lint_on_enter!ale_lint_on_filetype_changed\29ale_lint_on_insert_leave\29ale_lint_on_text_changed\6g\bvim\0", "config", "ale")
time([[Config for ale]], false)
-- Config for: root-climber.nvim
time([[Config for root-climber.nvim]], true)
try_loadstring("\27LJ\2\n=\0\1\4\0\2\0\n\v\0\0\0X\1\4Ä6\1\0\0'\3\1\0B\1\2\1X\1\3Ä6\1\0\0\18\3\0\0B\1\2\1K\0\1\0\fnothing\nprintF\1\1\5\0\5\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0003\4\4\0B\1\3\1K\0\1\0\0\targs\brun\17root-climber\frequire=\0\1\4\0\2\0\n\v\0\0\0X\1\4Ä6\1\0\0'\3\1\0B\1\2\1X\1\3Ä6\1\0\0\18\3\0\0B\1\2\1K\0\1\0\fnothing\nprintJ\1\1\5\0\5\0\b6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0003\4\4\0B\1\3\1K\0\1\0\0\targs\ffzf_run\17root-climber\frequireÕ\1\1\0\5\0\v\0\0196\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0'\2\5\0003\3\6\0005\4\a\0B\0\4\0016\0\0\0009\0\3\0009\0\4\0'\2\b\0003\3\t\0005\4\n\0B\0\4\1K\0\1\0\1\0\1\nnargs\3\1\0\23FzfTestRootClimber\1\0\1\nnargs\3\1\0\20TestRootClimber\29nvim_create_user_command\bapi root_climber#always_confirm\6g\bvim\0", "config", "root-climber.nvim")
time([[Config for root-climber.nvim]], false)
-- Config for: clever-f.vim
time([[Config for clever-f.vim]], true)
try_loadstring("\27LJ\2\n]\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0K\0\1\0\24clever_f_smart_case\28clever_f_across_no_line\6g\bvim\0", "config", "clever-f.vim")
time([[Config for clever-f.vim]], false)
-- Config for: splitjoin.vim
time([[Config for splitjoin.vim]], true)
try_loadstring('\27LJ\2\n}\0\0\2\0\4\0\t6\0\0\0009\0\1\0)\1\0\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0K\0\1\0"splitjoin_curly_brace_padding2splitjoin_html_attributes_bracket_on_new_line\6g\bvim\0', "config", "splitjoin.vim")
time([[Config for splitjoin.vim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nU\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\0\1\0\1\vcss_fn\2\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\nƒ\2\0\0\6\0\15\0!6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1<\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\6\0009\0\a\0'\2\b\0'\3\f\0'\4\r\0005\5\14\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\22:NERDTreeFind<CR>\n<C-\\>\1\0\1\fnoremap\2\24:NERDTreeToggle<CR>\14<leader>t\6n\20nvim_set_keymap\bapi\29NERDTreeAutoDeleteBuffer\20NERDTreeWinSize\23NERDTreeShowHidden\23NERDTreeQuitOnOpen\6g\bvim\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
-- Config for: coc.nvim
time([[Config for coc.nvim]], true)
try_loadstring("\27LJ\2\n±\a\0\0\a\0 \0Y6\0\0\0009\0\1\0005\1\3\0=\1\2\0005\0\4\0006\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\b\0'\5\t\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\n\0'\5\v\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\f\0'\5\r\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\14\0'\5\15\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\16\0'\5\17\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\18\0'\5\19\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\20\0'\5\21\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\22\0'\5\23\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\a\0'\4\24\0'\5\25\0\18\6\0\0B\1\5\0016\1\0\0009\1\5\0019\1\6\1'\3\26\0'\4\27\0'\5\28\0005\6\29\0B\1\5\0016\1\30\0'\3\31\0B\1\2\1K\0\1\0\26setlocal shortmess+=c\bcmd\1\0\3\vsilent\2\texpr\2\fnoremap\2\18coc#refresh()\n<c-l>\6i <Plug>(coc-codeaction-line)\r<space>a\27<Plug>(coc-codeaction)\r<space>A\23<Plug>(coc-rename)\r<space>r\27<Plug>(coc-references)\r<space>*::call CocAction('jumpTypeDefinition', 'tab drop')<CR>\r<space>T6:call CocAction('jumpTypeDefinition', 'edit')<CR>\r<space>t6:call CocAction('jumpDefinition', 'tab drop')<CR>\r<space>D2:call CocAction('jumpDefinition', 'edit')<CR>\r<space>d#:call CocAction('doHover')<CR>\r<space>h\6n\bset\vkeymap\1\0\1\vsilent\2\1\4\0\0\17coc-tsserver\22coc-spell-checker\20coc-sumneko-lua\26coc_global_extensions\6g\bvim\0", "config", "coc.nvim")
time([[Config for coc.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n–\2\0\0\5\0\r\0\0246\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\v\0005\4\n\0=\4\5\3=\3\f\2B\0\2\1K\0\1\0\15extensions\1\0\0\1\0\2\21prefer_locations\2\22prefer_references\2\rdefaults\1\0\0\1\0\3\20layout_strategy\25bottom_pane_vertical\26dynamic_preview_title\2\18results_title\5\nsetup\bcoc\19load_extension\14telescope\25bottom_pane_vertical\29configs/telescope_layout\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-sonictemplate
time([[Config for vim-sonictemplate]], true)
try_loadstring("\27LJ\2\nU\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\21~/.vim-templates#sonictemplate_vim_template_dir\6g\bvim\0", "config", "vim-sonictemplate")
time([[Config for vim-sonictemplate]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\ná\a\0\0\6\0$\1W6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0006\0\0\0009\0\1\0*\1\0\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0006\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\t\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\20\0'\4\21\0005\5\22\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\r\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\16\0'\4\25\0005\5\26\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\0\0009\0\a\0009\0\b\0'\2\19\0'\3\30\0'\4\31\0005\5 \0B\0\5\0016\0!\0'\2\"\0B\0\2\0016\0!\0'\2#\0B\0\2\1K\0\1\0\28hi Floaterm guifg=white\28hi Floaterm guibg=black\bcmd\1\0\2\fnoremap\2\vsilent\2 <C-\\><C-n>:FloatermNext<CR>\v<c-s>]\1\0\2\fnoremap\2\vsilent\2 <C-\\><C-n>:FloatermPrev<CR>\v<c-s>[\1\0\2\fnoremap\2\vsilent\2 <C-\\><C-n>:FloatermKill<CR>\1\0\2\fnoremap\2\vsilent\2\"<C-\\><C-n>:FloatermToggle<CR>\1\0\2\fnoremap\2\vsilent\2\15<C-\\><C-n>\n<Esc>\6t\1\0\2\fnoremap\2\vsilent\2\22:FloatermKill<CR>\v<c-s>q\1\0\2\fnoremap\2\vsilent\2\24:FloatermToggle<CR>\v<c-s>s\1\0\2\fnoremap\2\vsilent\2\21:FloatermNew<CR>\v<c-s>n\6n\20nvim_set_keymap\bapi\vcenter\22floaterm_position\20floaterm_height\19floaterm_width\23floaterm_autoclose\6g\bvimõ≥ÊÃ\25Ãô≥ˇ\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: editorconfig-vim
time([[Config for editorconfig-vim]], true)
try_loadstring('\27LJ\2\nZ\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\3\0\0\18fugitive://.*\rscp://.*"EditorConfig_exclude_patterns\6g\bvim\0', "config", "editorconfig-vim")
time([[Config for editorconfig-vim]], false)
-- Config for: vim-fugitive
time([[Config for vim-fugitive]], true)
try_loadstring("\27LJ\2\nï\1\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0<autocmd BufReadPost /^fugitive://* set bufhidden=delete:autocmd BufReadPost fugitive://* set bufhidden=delete\bcmd\0", "config", "vim-fugitive")
time([[Config for vim-fugitive]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nŸ\1\0\0\b\1\t\0\26-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\6Ä6\0\1\0009\0\2\0009\0\3\0'\2\4\0B\0\2\1X\0\14Ä6\0\1\0009\0\2\0009\0\5\0006\2\1\0009\2\2\0029\2\6\2'\4\a\0+\5\2\0+\6\2\0+\a\2\0B\2\5\2'\3\b\0+\4\2\0B\0\4\1K\0\1\0\0¿\6n\n<Tab>\27nvim_replace_termcodes\18nvim_feedkeys!<Plug>luasnip-expand-snippet\15nvim_input\bapi\bvim\15expandableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0¿\tjump\rjumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2ˇˇB\0\2\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2ˇˇB\0\2\1K\0\1\0\0¿\tjump\rjumpable“\1\1\0\a\0\15\0\0296\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\6\0003\5\a\0005\6\b\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\t\0003\5\n\0005\6\v\0B\1\5\0016\1\2\0009\1\3\0019\1\4\1'\3\5\0'\4\f\0003\5\r\0005\6\14\0B\1\5\0012\0\0ÄK\0\1\0\1\0\1\vsilent\2\0\n<C-k>\1\0\1\vsilent\2\0\n<C-j>\1\0\1\vsilent\2\0\n<Tab>\6i\bset\vkeymap\bvim\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
