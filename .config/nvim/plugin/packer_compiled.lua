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
local package_path_str = "/home/hkupty/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hkupty/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  cmp_luasnip = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["daedalus.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/daedalus.nvim",
    url = "/opt/code/vigemus/daedalus.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["iceberg.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/iceberg.vim",
    url = "https://github.com/cocopon/iceberg.vim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
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
  ["jq.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/jq.vim",
    url = "https://github.com/vito-c/jq.vim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/kotlin-vim",
    url = "https://github.com/udalov/kotlin-vim"
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
  neogen = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
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
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree-docs"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-tree-docs",
    url = "https://github.com/nvim-treesitter/nvim-tree-docs"
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
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fsymbols\1\0\0\1\5\0\0\b◉\b○\b✸\b✿\nsetup\16org-bullets\frequire\0" },
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/org-bullets.nvim",
    url = "https://github.com/akinsho/org-bullets.nvim"
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
  ["runes.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/runes.nvim",
    url = "/opt/code/hkupty/runes.nvim"
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
  ["telekasten.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/telekasten.nvim",
    url = "https://github.com/renerocksai/telekasten.nvim"
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
  ["vim-clojure-static"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static",
    url = "https://github.com/fholiveira/vim-clojure-static"
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
  ["vim-lua"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-lua",
    url = "https://github.com/tbastos/vim-lua"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
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
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: org-bullets.nvim
time([[Config for org-bullets.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fsymbols\1\0\0\1\5\0\0\b◉\b○\b✸\b✿\nsetup\16org-bullets\frequire\0", "config", "org-bullets.nvim")
time([[Config for org-bullets.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType scala ++once lua require("packer.load")({'vim-scaladoc', 'vim-scala'}, { ft = "scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-python-pep8-indent'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType sbt.scala ++once lua require("packer.load")({'vim-sbt'}, { ft = "sbt.scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'vim-sexp', 'vim-clojure-static'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType Dockerfile ++once lua require("packer.load")({'Dockerfile.vim'}, { ft = "Dockerfile" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt/ftdetect/sbt.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt/ftdetect/sbt.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt/ftdetect/sbt.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala/ftdetect/scala.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala/ftdetect/scala.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala/ftdetect/scala.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
