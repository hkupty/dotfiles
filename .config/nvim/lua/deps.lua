-- luacheck: globals vim use
local code = vim.fn.expand("$CODE")

require('lazy').setup({
  { 'wbthomason/packer.nvim',        optional = true },
  -- Make it fast
  { 'lewis6991/impatient.nvim' },
  --     { 'nathom/filetype.nvim' },

  { "lukas-reineke/virt-column.nvim" },

  -- LSP support
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
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
    },
  },

  { "linrongbin16/lsp-progress.nvim" },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
  },

  { "rcasia/neotest-java" },
  { "nvim-neotest/neotest-go" },

  -- API client
  { dir = code .. '/vigemus/daedalus.nvim' },

  -- Task tracking
  { dir = code .. '/vigemus/steadfast.nvim' },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },

  { 'ThePrimeagen/git-worktree.nvim' },

  -- Dark colors
  { 'EdenEast/nightfox.nvim' },
  { 'folke/tokyonight.nvim' },

  -- Code Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'f3fora/cmp-spell' },
      { 'piero-vic/cmp-ledger' },
      { 'ray-x/cmp-treesitter' },
      { 'uga-rosa/cmp-dictionary' },
    },
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      { 'kyazdani42/nvim-web-devicons', optional = true },
    },
  },

  -- test
  { 'vim-test/vim-test' },

  -- Lint
  { 'mfussenegger/nvim-lint' },

  -- Ctags
  { 'ludovicchabant/vim-gutentags' },

  -- Spelling
  { 'lewis6991/spellsitter.nvim' },
  { 'mateusbraga/vim-spell-pt-br' },

  -- Colors
  { 'norcalli/nvim-colorizer.lua' },

  -- Tmux substitute
  { dir = code .. '/vigemus/nvimux' },

  -- Repls
  { dir = code .. '/vigemus/iron.nvim' },
  { dir = code .. '/vigemus/trex.nvim' },

  -- Lua tests
  { dir = code .. '/hkupty/runes.nvim' },

  -- Prompt utils
  { dir = code .. '/vigemus/impromptu.nvim' },

  -- filetype tinkering
  { dir = code .. '/vigemus/classifier.nvim' },

  -- Navigation
  { "nvim-telescope/telescope.nvim",           dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } },
  { "nvim-telescope/telescope-fzy-native.nvim" },

  -- Points to where I want
  { dir = code .. '/vigemus/pointer.nvim' },

  { 'mhartington/formatter.nvim' },

  -- Filesystem tinkering
  { 'stevearc/oil.nvim' },
  -- TODO evaluate
  { 'danymat/neogen' },

  -- Git stuff
  { 'TimUntersberger/neogit' },

  -- Search TODO comments
  { 'folke/todo-comments.nvim' },

  -- Tpope stuff
  { 'tpope/vim-surround' },
  { 'tpope/vim-speeddating' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-eunuch' },

  -- Eyecandy
  { 'kyazdani42/nvim-web-devicons' },

  -- Syntax specific and some more stuff
  -- Docker
  { 'ekalinin/Dockerfile.vim',                 ft = { 'Dockerfile' } },

  -- Lua
  { 'tbastos/vim-lua' },

  -- Rust
  {
    'rust-lang/rust.vim',
    ft = { 'rust' },
    dependencies = { 'mattn/webapi-vim' },
  },

  -- Clojure
  { dir = code .. '/clojure-vim/acid.nvim',           ft = 'clojure' },
  { dir = code .. '/clojure-vim/jazz.nvim',           ft = 'clojure' },
  { dir = code .. '/clojure-vim/async-clj-highlight', ft = 'clojure' },
  { 'guns/vim-sexp',                                  ft = 'clojure' },
  { 'clojure-vim/async-clj-omni',                     ft = 'clojure' },
  { 'fholiveira/vim-clojure-static',                  ft = 'clojure', branch = 'hack-update' },

  -- Splunk!
  { 'vim-scripts/splunk.vim' },

  -- json
  { 'elzr/vim-json' },

  -- Kotlin
  { 'udalov/kotlin-vim' },

  -- Yaml
  { 'pedrohdz/vim-yaml-folds' },

  -- Treesitter <3
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-tree-docs',
    },
  },

  { 'folke/twilight.nvim' },
  { 'folke/zen-mode.nvim' },

  { 'nvim-treesitter/playground' },

  -- Dim inactive windows
  { 'blueyed/vim-diminactive' },

  { 'jvirtanen/vim-hcl' },

  -- jq syntax
  { 'vito-c/jq.vim' },

  { 'elkowar/yuck.vim' },

  { 'ray-x/go.nvim',             ft = { 'go' } },

  -- Plant UML
  { 'aklt/plantuml-syntax' },

  { 'jjo/vim-cue' },

  { 'phaazon/hop.nvim' },
})
