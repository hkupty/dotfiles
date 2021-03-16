" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/hkupty/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["Dockerfile.vim"] = {
    loaded = false,
    needs_bufread = true,
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
  ["base16-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/base16-vim"
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
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/deoplete-jedi"
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
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/jedi-vim"
  },
  ["jq.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/jq.vim"
  },
  ["let-modeline.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/let-modeline.vim"
  },
  ["neco-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/neco-vim"
  },
  neogit = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["neosnippet-snippets"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neosnippet-snippets"
  },
  ["neosnippet.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neosnippet.vim"
  },
  ["neovim-gui-shim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/neovim-gui-shim"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nerdcommenter"
  },
  ["nord-vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nord-vim"
  },
  nvim = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lsp"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/nvim-lsp"
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
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/onedark.vim"
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
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["pointer.nvim"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/pointer.nvim"
  },
  ["rust.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim"
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
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-ripgrep"] = {
    loaded = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/start/vim-ripgrep"
  },
  ["vim-sbt"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt"
  },
  ["vim-scala"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala"
  },
  ["vim-scaladoc"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scaladoc"
  },
  ["vim-sexp"] = {
    loaded = false,
    needs_bufread = false,
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

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType vim ++once lua require("packer.load")({'neco-vim'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'jedi-vim', 'vim-python-pep8-indent', 'deoplete-jedi'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType clojure ++once lua require("packer.load")({'vim-clojure-static', 'vim-sexp'}, { ft = "clojure" }, _G.packer_plugins)]]
vim.cmd [[au FileType scala ++once lua require("packer.load")({'vim-scala', 'vim-scaladoc'}, { ft = "scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType Dockerfile ++once lua require("packer.load")({'Dockerfile.vim'}, { ft = "Dockerfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType sbt.scala ++once lua require("packer.load")({'vim-sbt'}, { ft = "sbt.scala" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust.vim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/Dockerfile.vim]]
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/Dockerfile.vim/ftdetect/docker-compose.vim]]
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-scala/ftdetect/scala.vim]]
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-sbt/ftdetect/sbt.vim]]
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/vim-clojure-static/ftdetect/clojure.vim]]
vim.cmd [[source /home/hkupty/.local/share/nvim/site/pack/packer/opt/rust.vim/ftdetect/rust.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
