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
  local success, result = pcall(loadstring(s))
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
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim"
  },
  ["acid.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/acid.nvim"
  },
  ale = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["async-clj-highlight"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/async-clj-highlight"
  },
  ["async-clj-omni"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/async-clj-omni"
  },
  ["bighut.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/bighut.nvim"
  },
  ["cartographer.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/cartographer.nvim"
  },
  ["classifier.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/classifier.nvim"
  },
  ["daedalus.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/daedalus.nvim"
  },
  ["deoplete-jedi"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/deoplete-jedi"
  },
  ["deoplete-lsp"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/deoplete-lsp"
  },
  ["deoplete-tag"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/deoplete-tag"
  },
  ["deoplete.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/deoplete.nvim"
  },
  ["echodoc.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/echodoc.vim"
  },
  ["errands.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/errands.nvim"
  },
  ["express_line.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/express_line.nvim"
  },
  ["fennel.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/fennel.vim"
  },
  ["foam.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/foam.nvim"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/gina.vim"
  },
  ["gist-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/gist-vim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gojira.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/gojira.nvim"
  },
  ["goyo.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/goyo.vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["impromptu.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/impromptu.nvim"
  },
  ["iron.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/iron.nvim"
  },
  ["jazz.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/jazz.nvim"
  },
  ["jedi-vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/jedi-vim"
  },
  ["jq.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/jq.vim"
  },
  ["kotlin-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/kotlin-vim"
  },
  ["let-modeline.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/let-modeline.vim"
  },
  ["neco-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/neco-vim"
  },
  neogit = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["neovim-gui-shim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neovim-gui-shim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  nvim = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim"
  },
  ["nvim-base16"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-base16"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-luadev"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  nvimux = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvimux"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plantuml-syntax"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/plantuml-syntax"
  },
  playground = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["pointer.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/pointer.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim"
  },
  ["sidebar.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/sidebar.nvim"
  },
  ["splunk.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/splunk.vim"
  },
  tagbar = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  taskwiki = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/taskwiki"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["trex.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/trex.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-bazel"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-bazel"
  },
  ["vim-clojure-static"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static"
  },
  ["vim-cool"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-cool"
  },
  ["vim-diminactive"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-diminactive"
  },
  ["vim-dirvish"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-dirvish"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-json"
  },
  ["vim-ledger"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-ledger"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-lion"
  },
  ["vim-lua"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-lua"
  },
  ["vim-maktaba"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-maktaba"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-nix"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-nix"
  },
  ["vim-orgmode"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-orgmode"
  },
  ["vim-plugin-AnsiEsc"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-plugin-AnsiEsc"
  },
  ["vim-python-pep8-indent"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-sbt"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt"
  },
  ["vim-scala"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala"
  },
  ["vim-scaladoc"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scaladoc"
  },
  ["vim-sexp"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sexp"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-speeddating"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-speeddating"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-taskwarrior"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-taskwarrior"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-yaml-folds"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-yaml-folds"
  },
  vimagit = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vimagit"
  },
  vimwiki = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vimwiki"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/webapi-vim"
  },
  ["zettel.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/zettel.nvim"
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
