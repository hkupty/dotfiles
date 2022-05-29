-- luacheck: globals vim use
local code = vim.fn.expand("$CODE")

vim.cmd [[packadd packer.nvim]]

return require('packer').startup{
  function()
    use {'wbthomason/packer.nvim', opt = true}
    -- Make it fast
    use {'lewis6991/impatient.nvim'}
    use {'nathom/filetype.nvim'}

    -- LSP support
    use {'neovim/nvim-lspconfig'}

    -- API client
    use {code .. '/vigemus/daedalus.nvim'}


    use {'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
    }

    -- Dark colors
    use {'EdenEast/nightfox.nvim'}
    use {'cocopon/iceberg.vim'}

    -- Code Completion
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}
    use {'hrsh7th/cmp-cmdline'}
    use {'hrsh7th/cmp-nvim-lua'}
    use {'f3fora/cmp-spell'}
    use {'hrsh7th/nvim-cmp'}
    use {'ray-x/cmp-treesitter'}

  -- snippets
    use {'L3MON4D3/LuaSnip'}
    use {'saadparwaiz1/cmp_luasnip'}
    use {'rafamadriz/friendly-snippets'}

    -- Statusline
    use {'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- LSP progress
    use {'arkav/lualine-lsp-progress'}
    use {'j-hui/fidget.nvim', config = function()
      require("fidget").setup{}
    end}


    -- Ctags
    use {'ludovicchabant/vim-gutentags'}

    -- Spelling
    use {'lewis6991/spellsitter.nvim'}
    use {'mateusbraga/vim-spell-pt-br'}

    -- Colors
    use {'norcalli/nvim-colorizer.lua'}

    -- Tmux substitute
    use {code .. '/vigemus/nvimux'}

    -- Repls
    use {code .. '/vigemus/iron.nvim'}
    use {code .. '/vigemus/trex.nvim'}

    -- Lua tests
    use {code .. '/hkupty/runes.nvim'}

    -- Prompt utils
    use {code .. '/vigemus/impromptu.nvim'}

    -- filetype tinkering
    use {code .. '/vigemus/classifier.nvim'}

    -- Navigation
    use {"nvim-telescope/telescope.nvim", requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
    use {"nvim-telescope/telescope-fzy-native.nvim"}

    -- Points to where I want
    use {code .. '/vigemus/pointer.nvim'}

    -- Make
    use {'w0rp/ale'}

    -- Filesystem tinkering
    use {'justinmk/vim-dirvish'}

    -- Code commenting
    use {'terrortylor/nvim-comment'}
    use {'danymat/neogen'} -- TODO evaluate

    -- Git stuff
    use {'TimUntersberger/neogit'}
    use {'pwntester/octo.nvim'}

    -- Sidebar
    use {'sidebar-nvim/sidebar.nvim'}

    -- Search TODO comments
    use {'folke/todo-comments.nvim'}

    -- Tpope stuff
    use {'tpope/vim-surround'}
    use {'tpope/vim-unimpaired'}
    use {'tpope/vim-speeddating'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-abolish'}
    use {'tpope/vim-eunuch'}

    -- Eyecandy
    use {'kyazdani42/nvim-web-devicons'}

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
    -- use {'davidhalter/jedi-vim', ft = {'python'} }
    -- use {'zchee/deoplete-jedi', ft = {'python'} }

    -- Splunk!
    use {'vim-scripts/splunk.vim'}

    -- json
    use {'elzr/vim-json'}

    -- Kotlin
    use {'udalov/kotlin-vim'}

    -- Yaml
    use {'pedrohdz/vim-yaml-folds'}

    -- orgmode
    use {'nvim-orgmode/orgmode'}
    use {'akinsho/org-bullets.nvim',
      config = function()
        require("org-bullets").setup {
            symbols = { "◉", "○", "✸", "✿" }
        }
      end
    }

    -- vimwiki
    -- TODO check out if vimwiki is still worth it
    use {'vimwiki/vimwiki', branch = "dev"}
    use {'tools-life/taskwiki',
      requires = {
        "blindFS/vim-taskwarrior",
        "preservim/tagbar",
        "powerman/vim-plugin-AnsiEsc"
      }
    }

    -- TODO replace vimwiki for telekasten
    use {'renerocksai/telekasten.nvim'}

    -- Treesitter <3
    use {'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }

    use {'nvim-treesitter/nvim-treesitter-refactor'}
    use {'nvim-treesitter/nvim-treesitter-textobjects'}
    use {'nvim-treesitter/nvim-tree-docs'}

    use {'nvim-treesitter/playground'}

    -- Dim inactive windows
    use {'blueyed/vim-diminactive'}

    -- jq syntax
    use {'vito-c/jq.vim'}

    -- Plan UML
    use {'aklt/plantuml-syntax'}

    -- Markdown syntax
    use {'preservim/vim-markdown'}

    use {'phaazon/hop.nvim'}

  end,
  config = {ensure_dependencies = true}
}
