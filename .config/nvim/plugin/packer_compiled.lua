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
local package_path_str = "/home/hkupty/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.1.1716656478/share/lua/5.1/?/init.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.1.1716656478/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hkupty/.cache/nvim/packer_hererocks/2.1.1716656478/lib/lua/5.1/?.so"
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
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["acid.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/acid.nvim",
    url = "/opt/code/clojure-vim/acid.nvim"
  },
  ["async-clj-highlight"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/async-clj-highlight",
    url = "/opt/code/clojure-vim/async-clj-highlight"
  },
  ["async-clj-omni"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/async-clj-omni",
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
  ["cmp-dictionary"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-ledger"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cmp-ledger",
    url = "https://github.com/piero-vic/cmp-ledger"
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
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["git-worktree.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/git-worktree.nvim",
    url = "https://github.com/ThePrimeagen/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
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
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/jazz.nvim",
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
  ["lsp-progress.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/lsp-progress.nvim",
    url = "https://github.com/linrongbin16/lsp-progress.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
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
  neotest = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neotest",
    url = "https://github.com/nvim-neotest/neotest"
  },
  ["neotest-go"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neotest-go",
    url = "https://github.com/nvim-neotest/neotest-go"
  },
  ["neotest-java"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neotest-java",
    url = "https://github.com/rcasia/neotest-java"
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
  ["nvim-lint"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nio"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-nio",
    url = "https://github.com/nvim-neotest/nvim-nio"
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
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
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
  ["oil.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
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
  ["steadfast.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/steadfast.nvim",
    url = "/opt/code/vigemus/steadfast.nvim"
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
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trex.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/trex.nvim",
    url = "/opt/code/vigemus/trex.nvim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
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
  ["vim-cue"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-cue",
    url = "https://github.com/jjo/vim-cue"
  },
  ["vim-diminactive"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-diminactive",
    url = "https://github.com/blueyed/vim-diminactive"
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
  ["vim-hcl"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-hcl",
    url = "https://github.com/jvirtanen/vim-hcl"
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
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
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
  ["vim-test"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-yaml-folds"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-yaml-folds",
    url = "https://github.com/pedrohdz/vim-yaml-folds"
  },
  ["virt-column.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/virt-column.nvim",
    url = "https://github.com/lukas-reineke/virt-column.nvim"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  },
  ["yuck.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  },
  ["zen-mode.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType Dockerfile ++once lua require("packer.load")({'Dockerfile.vim'}, { ft = "Dockerfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'jazz.nvim', 'vim-clojure-static', 'async-clj-highlight', 'acid.nvim', 'async-clj-omni', 'vim-sexp'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/filetype.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/filetype.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/go.nvim/ftdetect/filetype.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]], false)
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]], true)
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]]
time([[Sourcing ftdetect script at: /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]], false)
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
