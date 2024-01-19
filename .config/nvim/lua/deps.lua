-- luacheck: globals vim use
local code = vim.fn.expand("$CODE")

vim.cmd [[packadd packer.nvim]]

return require('packer').startup {
  function()
    use { 'wbthomason/packer.nvim', opt = true }
    -- Make it fast
    use { 'lewis6991/impatient.nvim' }
    -- use { 'nathom/filetype.nvim' }

    use { "lukas-reineke/virt-column.nvim" }

    -- LSP support
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' }, -- Required
        {
          -- Optional
          'williamboman/mason.nvim',
          run = function()
            pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        { 'williamboman/mason-lspconfig.nvim' }, -- Optional
        {
          'j-hui/fidget.nvim',
          tag = 'legacy',
          config = function()
            require("fidget").setup {}
          end
        },

        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },     -- Required
        { 'hrsh7th/cmp-nvim-lsp' }, -- Required
        { 'L3MON4D3/LuaSnip' },     -- Required
      }
    }

    -- API client
    use { code .. '/vigemus/daedalus.nvim' }

    -- Task tracking
    use { code .. '/vigemus/steadfast.nvim' }

    use { 'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }

    use { 'ThePrimeagen/git-worktree.nvim' }

    -- Dark colors
    use { 'EdenEast/nightfox.nvim' }
    use { 'folke/tokyonight.nvim' }

    -- Code Completion
    use { 'hrsh7th/nvim-cmp',
      requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'f3fora/cmp-spell' },
        { 'piero-vic/cmp-ledger' },
        { 'ray-x/cmp-treesitter' },
        { 'uga-rosa/cmp-dictionary' },
      }
    }

    -- Statusline
    use { 'nvim-lualine/lualine.nvim',
      requires = {
        { 'kyazdani42/nvim-web-devicons', opt = true },
        { 'arkav/lualine-lsp-progress' },
        { 'nvim-lua/lsp-status.nvim' },
      }
    }

    -- test
    use { 'vim-test/vim-test' }

    -- Lint
    use { 'mfussenegger/nvim-lint' }

    -- Ctags
    use { 'ludovicchabant/vim-gutentags' }

    -- Spelling
    use { 'lewis6991/spellsitter.nvim' }
    use { 'mateusbraga/vim-spell-pt-br' }

    -- Colors
    use { 'norcalli/nvim-colorizer.lua' }

    -- Tmux substitute
    use { code .. '/vigemus/nvimux' }

    -- Repls
    use { code .. '/vigemus/iron.nvim' }
    use { code .. '/vigemus/trex.nvim' }

    -- Lua tests
    use { code .. '/hkupty/runes.nvim' }

    -- Prompt utils
    use { code .. '/vigemus/impromptu.nvim' }

    -- filetype tinkering
    use { code .. '/vigemus/classifier.nvim' }

    -- Navigation
    use { "nvim-telescope/telescope.nvim", requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } }
    use { "nvim-telescope/telescope-fzy-native.nvim" }

    -- Points to where I want
    use { code .. '/vigemus/pointer.nvim' }

    use { 'mhartington/formatter.nvim' }

    -- Filesystem tinkering
    use { 'stevearc/oil.nvim' }

    -- Code commenting
    use { 'terrortylor/nvim-comment' }
    use { 'danymat/neogen' } -- TODO evaluate

    -- Git stuff
    use { 'TimUntersberger/neogit' }

    -- Search TODO comments
    use { 'folke/todo-comments.nvim' }

    -- Tpope stuff
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-speeddating' }
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-abolish' }
    use { 'tpope/vim-eunuch' }

    -- Eyecandy
    use { 'kyazdani42/nvim-web-devicons' }

    -- Syntax specific and some more stuff
    -- Docker
    use { 'ekalinin/Dockerfile.vim', ft = { 'Dockerfile' } }

    -- Lua
    use { 'tbastos/vim-lua' }

    -- Rust
    use { 'rust-lang/rust.vim', ft = { 'rust' },
      requires = { 'mattn/webapi-vim' }
    }

    -- Clojure
    use { code .. '/clojure-vim/acid.nvim', ft = 'clojure' }
    use { code .. '/clojure-vim/jazz.nvim', ft = 'clojure' }
    use { code .. '/clojure-vim/async-clj-highlight', ft = 'clojure' }
    use { 'guns/vim-sexp', ft = 'clojure' }
    use { 'clojure-vim/async-clj-omni', ft = 'clojure' }
    use { 'fholiveira/vim-clojure-static', ft = 'clojure', branch = 'hack-update' }

    -- Splunk!
    use { 'vim-scripts/splunk.vim' }

    -- json
    use { 'elzr/vim-json' }

    -- Kotlin
    use { 'udalov/kotlin-vim' }

    -- Yaml
    use { 'pedrohdz/vim-yaml-folds' }

    -- Treesitter <3
    use { 'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      requires = {
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-context',
        'nvim-treesitter/nvim-tree-docs',
      }
    }

    use { 'folke/twilight.nvim' }
    use { 'folke/zen-mode.nvim' }

    use { 'nvim-treesitter/playground' }

    -- Dim inactive windows
    use { 'blueyed/vim-diminactive' }

    use { 'jvirtanen/vim-hcl' }

    -- jq syntax
    use { 'vito-c/jq.vim' }

    use { 'ray-x/go.nvim', ft = { 'go' } }

    -- Plant UML
    use { 'aklt/plantuml-syntax' }

    -- Markdown syntax
    use { 'preservim/vim-markdown' }

    use { 'jjo/vim-cue' }

    use { 'phaazon/hop.nvim' }
  end,
  config = { ensure_dependencies = true }
}
