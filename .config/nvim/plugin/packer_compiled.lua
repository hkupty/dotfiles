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
local package_path_str = "/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
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
  ["Dockerfile.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim",
    url = "https://github.com/ekalinin/Dockerfile.vim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["acid.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/acid.nvim",
    url = "/opt/code/clojure-vim/acid.nvim"
  },
  ale = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/w0rp/ale"
  },
  ["async-clj-highlight"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/async-clj-highlight",
    url = "/opt/code/clojure-vim/async-clj-highlight"
  },
  ["async-clj-omni"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/async-clj-omni",
    url = "https://github.com/clojure-vim/async-clj-omni"
  },
  ["classifier.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/classifier.nvim",
    url = "/opt/code/vigemus/classifier.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-spell"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-treesitter"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  ["daedalus.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/daedalus.nvim",
    url = "/opt/code/vigemus/daedalus.nvim"
  },
  ["deoplete-jedi"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/deoplete-jedi",
    url = "https://github.com/zchee/deoplete-jedi"
  },
  ["echodoc.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/echodoc.vim",
    url = "https://github.com/Shougo/echodoc.vim"
  },
  ["fennel.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/fennel.vim",
    url = "https://github.com/bakpakin/fennel.vim"
  },
  ["gist-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/gist-vim",
    url = "https://github.com/mattn/gist-vim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/github-nvim-theme",
    url = "https://github.com/projekt0n/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/goyo.vim",
    url = "https://github.com/junegunn/goyo.vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impromptu.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/impromptu.nvim",
    url = "/opt/code/vigemus/impromptu.nvim"
  },
  ["iron.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/iron.nvim",
    url = "/opt/code/vigemus/iron.nvim"
  },
  ["jazz.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/jazz.nvim",
    url = "/opt/code/clojure-vim/jazz.nvim"
  },
  ["jedi-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/jedi-vim",
    url = "https://github.com/davidhalter/jedi-vim"
  },
  ["jq.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/jq.vim",
    url = "https://github.com/vito-c/jq.vim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/kotlin-vim",
    url = "https://github.com/udalov/kotlin-vim"
  },
  ["let-modeline.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/let-modeline.vim",
    url = "https://github.com/vim-scripts/let-modeline.vim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mini.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["neco-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/neco-vim",
    url = "https://github.com/Shougo/neco-vim"
  },
  neogit = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["neovim-gui-shim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neovim-gui-shim",
    url = "https://github.com/equalsraf/neovim-gui-shim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-base16",
    url = "https://github.com/RRethy/nvim-base16"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-luadev",
    url = "https://github.com/bfredl/nvim-luadev"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  nvimux = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvimux",
    url = "/opt/code/vigemus/nvimux"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/oceanic-next",
    url = "https://github.com/mhartington/oceanic-next"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  orgmode = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  playground = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["pointer.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/pointer.nvim",
    url = "/opt/code/vigemus/pointer.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["sidebar.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/sidebar.nvim",
    url = "https://github.com/sidebar-nvim/sidebar.nvim"
  },
  ["spellsitter.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["splunk.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/splunk.vim",
    url = "https://github.com/vim-scripts/splunk.vim"
  },
  tagbar = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/tagbar",
    url = "https://github.com/preservim/tagbar"
  },
  taskwiki = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/taskwiki",
    url = "https://github.com/tools-life/taskwiki"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trex.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/trex.nvim",
    url = "/opt/code/vigemus/trex.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-bazel"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-bazel",
    url = "https://github.com/bazelbuild/vim-bazel"
  },
  ["vim-clojure-static"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static",
    url = "https://github.com/fholiveira/vim-clojure-static"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-cool",
    url = "https://github.com/romainl/vim-cool"
  },
  ["vim-diminactive"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-diminactive",
    url = "https://github.com/blueyed/vim-diminactive"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-dirvish",
    url = "https://github.com/justinmk/vim-dirvish"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-gutentags",
    url = "https://github.com/ludovicchabant/vim-gutentags"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-json",
    url = "https://github.com/elzr/vim-json"
  },
  ["vim-ledger"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-ledger",
    url = "https://github.com/ledger/vim-ledger"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
  },
  ["vim-lua"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-lua",
    url = "https://github.com/tbastos/vim-lua"
  },
  ["vim-maktaba"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-maktaba",
    url = "https://github.com/google/vim-maktaba"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-nix",
    url = "https://github.com/LnL7/vim-nix"
  },
  ["vim-plugin-AnsiEsc"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-plugin-AnsiEsc",
    url = "https://github.com/powerman/vim-plugin-AnsiEsc"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent",
    url = "https://github.com/hynek/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-sbt"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt",
    url = "https://github.com/derekwyatt/vim-sbt"
  },
  ["vim-scala"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala",
    url = "https://github.com/derekwyatt/vim-scala"
  },
  ["vim-scaladoc"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scaladoc",
    url = "https://github.com/mdreves/vim-scaladoc"
  },
  ["vim-sexp"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sexp",
    url = "https://github.com/guns/vim-sexp"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-speeddating",
    url = "https://github.com/tpope/vim-speeddating"
  },
  ["vim-spell-pt-br"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-spell-pt-br",
    url = "https://github.com/mateusbraga/vim-spell-pt-br"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-taskwarrior"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-taskwarrior",
    url = "https://github.com/blindFS/vim-taskwarrior"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-yaml-folds"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-yaml-folds",
    url = "https://github.com/pedrohdz/vim-yaml-folds"
  },
  vimagit = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vimagit",
    url = "https://github.com/jreybert/vimagit"
  },
  vimwiki = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  }
}

time([[Defining packer_plugins]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType vim ++once lua require("packer.load")({'neco-vim'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'jedi-vim', 'vim-python-pep8-indent', 'deoplete-jedi'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'vim-clojure-static', 'vim-sexp'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType scala ++once lua require("packer.load")({'vim-scala', 'vim-scaladoc'}, { ft = "scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType Dockerfile ++once lua require("packer.load")({'Dockerfile.vim'}, { ft = "Dockerfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType sbt.scala ++once lua require("packer.load")({'vim-sbt'}, { ft = "sbt.scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala/ftdetect/scala.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala/ftdetect/scala.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala/ftdetect/scala.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt/ftdetect/sbt.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt/ftdetect/sbt.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt/ftdetect/sbt.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
