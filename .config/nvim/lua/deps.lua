-- luacheck: globals vim use
local code = vim.fn.expand("$CODE")

vim.cmd [[packadd packer.nvim]]

return require('packer').startup{
  function()
    use {'wbthomason/packer.nvim', opt = true}

    use {'bfredl/nvim-luadev'}

    -- LSP support
    use {'neovim/nvim-lspconfig'}

    -- API client
    use {code .. '/vigemus/daedalus.nvim'}

    -- Jira client
    -- use {code .. '/vigemus/gojira.nvim'}

    -- GUI stuff
    use {'equalsraf/neovim-gui-shim'}

    -- Dark colors
    --use {'joshdick/onedark.vim'}
    --use {'arcticicestudio/nord-vim'}
    --use {'chriskempson/base16-vim'}
    use {'projekt0n/github-nvim-theme'}
    use {'RRethy/nvim-base16'}
    use {'mhartington/oceanic-next'}
    use {'rebelot/kanagawa.nvim'}

    -- Code Completion
    use {'shougo/deoplete.nvim'}
    use {'deoplete-plugins/deoplete-lsp'}
    use {'deoplete-plugins/deoplete-tag'}

    -- Let on modeline
    use {'vim-scripts/let-modeline.vim'}

    -- Statusline
    use {'tjdevries/express_line.nvim', requires = {'nvim-lua/plenary.nvim'}}

    -- Better lua mapping
    -- TODO Drop this in favor of https://github.com/neovim/neovim/pull/13823
    use {'tjdevries/astronauta.nvim'}

    -- Ctags
    --use {'ludovicchabant/vim-gutentags'}

    use {'lewis6991/spellsitter.nvim'}
    use {'mateusbraga/vim-spell-pt-br'}

    -- Colors
    use {'norcalli/nvim-colorizer.lua'}

    -- Snippets
    --use {'shougo/neosnippet.vim', requires = {'shougo/neosnippet-snippets'}}

    -- Tmux substitute
    use {code .. '/vigemus/nvimux'}

    -- Github
    -- use {code .. '/vigemus/bighut.nvim'}

    -- Track work
    -- use {code .. '/vigemus/errands.nvim'}

    -- Bubbly windows
    -- use {code .. '/vigemus/foam.nvim'}

    -- Repls
    use {code .. '/vigemus/iron.nvim'}
    use {code .. '/vigemus/trex.nvim'}

    -- Le Dashboard
    -- use {code .. '/vigemus/bordet/nvim/'}


    -- Prompt utils
    use {code .. '/vigemus/impromptu.nvim'}

    -- Project Navigation
    use {code .. '/vigemus/classifier.nvim'}

    use {"nvim-telescope/telescope.nvim", requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
    use {"nvim-telescope/telescope-fzy-native.nvim"}

    -- Points to where I want
    use {code .. '/vigemus/pointer.nvim'}

    -- Make
    use {'w0rp/ale'}

    -- Filesystem tinkering
    use {'justinmk/vim-dirvish'}

    -- Code commenting
    use {'scrooloose/nerdcommenter'}

    -- Git stuff
    use {'mhinz/vim-signify'}
    use {'jreybert/vimagit'}
    use {'TimUntersberger/neogit'}
    use {'lambdalisue/gina.vim'}

    -- Sidebar
    use {'GustavoKatel/sidebar.nvim'}

    -- Search TODO comments
    use {'folke/todo-comments.nvim'}

    -- Tpope stuff
    use {'tpope/vim-surround'}
    use {'tpope/vim-unimpaired'}
    use {'tpope/vim-speeddating'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-abolish'}
    use {'tpope/vim-eunuch'}

    -- Gist
    use {'mattn/gist-vim', requires = {'mattn/webapi-vim'}}

    -- Eyecandy
    use {'kyazdani42/nvim-web-devicons'}

    -- Align
    use {'tommcdo/vim-lion'}

    -- Fn signatures
    use {'Shougo/echodoc.vim'}

    -- Syntax specific and some more stuff
    -- Docker
    use {'ekalinin/Dockerfile.vim', ft = {'Dockerfile'} }

    -- Lua
    use {'tbastos/vim-lua'}

    -- Scala
    --  use {'ensime/ensime-vim'}
    use {'derekwyatt/vim-scala', ft = {'scala'} }
    use {'mdreves/vim-scaladoc', ft = {'scala'} }

    -- Scala Build Tool - SBT
    use {'derekwyatt/vim-sbt', ft = {'sbt.scala'} }

    -- Rust
    use {'rust-lang/rust.vim', ft = {'rust'},
      requires = {'mattn/webapi-vim'}
    }

    -- Clojure
    use {code .. '/clojure-vim/acid.nvim'}
    use {code .. '/clojure-vim/jazz.nvim'}
    use {code .. '/clojure-vim/async-clj-highlight'}

    use {'guns/vim-sexp', ft = 'clojure' }
    use {'clojure-vim/async-clj-omni'}
    use {'fholiveira/vim-clojure-static', ft = {'clojure'}, branch = 'hack-update'}

    -- Python
    use {'hynek/vim-python-pep8-indent', ft = {'python'} }
    use {'davidhalter/jedi-vim', ft = {'python'} }
    use {'zchee/deoplete-jedi', ft = {'python'} }

    -- Bazel
    use {'google/vim-maktaba'}
    use {'bazelbuild/vim-bazel'}

    -- Nix
    use {'LnL7/vim-nix'}

    -- Vim - Vader
    use {'Shougo/neco-vim', ft = 'vim' }

    -- Splunk!
    use {'vim-scripts/splunk.vim'}

    -- json
    use {'elzr/vim-json'}

    -- Kotlin
    use {'udalov/kotlin-vim'}

    -- Yaml
    use {'pedrohdz/vim-yaml-folds'}

    -- Ledger
    use {'ledger/vim-ledger'}

    -- Fennel
    use {'bakpakin/fennel.vim'}

    -- Tasks
    --use {'jceb/vim-orgmode'}

    use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
    end
}

    use {'vimwiki/vimwiki', branch = "dev"}
    use {'tools-life/taskwiki',
      requires = {
        "blindFS/vim-taskwarrior",
        "preservim/tagbar",
        "powerman/vim-plugin-AnsiEsc"

      }
    }

    -- Treesitter <3
    use {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      requires = {
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects'
      }
    }

    use {'nvim-treesitter/playground'}
    --
    -- Dim inactive windows
    use {'blueyed/vim-diminactive'}

    -- jq syntax
    use {'vito-c/jq.vim'}

    -- Focus mode
    use {'junegunn/goyo.vim'}

    use {'romainl/vim-cool'}

    -- Plan UML
    use {'aklt/plantuml-syntax'}

    -- Markdown syntax
    use {'plasticboy/vim-markdown'}

    use {'phaazon/hop.nvim'}
  end,
  config = {ensure_dependencies = true}
}
