call plug#begin(stdpath('data') . '/plugged')

" TBD
Plug 'bfredl/nvim-luadev'

Plug 'jremmen/vim-ripgrep'

" LSP support
Plug $CODE.'/forks/nvim-lsp'

" Zettelkasten
Plug $CODE.'/vigemus/zettel.nvim'

" API client
Plug $CODE.'/vigemus/daedalus.nvim'

" Jira client
Plug $CODE.'/vigemus/gojira.nvim'

" GUI stuff
Plug 'equalsraf/neovim-gui-shim'

" Dark colors
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'fneu/breezy'
Plug 'skbolton/embark'
Plug 'co1ncidence/mountaineer.vim'
Plug 'co1ncidence/gunmetal.vim'

" Code Completion
Plug 'shougo/deoplete.nvim'

" Let on modeline
Plug 'vim-scripts/let-modeline.vim'

" Statusline
Plug 'nvim-lua/plenary.nvim'
Plug 'tjdevries/express_line.nvim'
"Plug 'itchyny/lightline.vim'

" Ctags
Plug 'ludovicchabant/vim-gutentags'

" Colors
Plug 'norcalli/nvim-colorizer.lua'

" Snippets
"Plug 'shougo/neosnippet.vim'
"Plug 'shougo/neosnippet-snippets'

" Match stuff
"Plug 'andymass/vim-matchup'

" Tmux substitute
Plug $CODE.'/vigemus/nvimux'

" Github
Plug $CODE.'/vigemus/bighut.nvim'

" Track work
Plug $CODE.'/vigemus/errands.nvim'

" Bubbly windows
Plug $CODE.'/vigemus/foam.nvim'

" Repls
Plug $CODE.'/vigemus/iron.nvim'
Plug $CODE.'/vigemus/trex.nvim'

" Le Dashboard
Plug $CODE.'/hkupty/bordet/nvim/'

" Prompt utils
Plug $CODE.'/vigemus/impromptu.nvim'

" Project Navigation
Plug $CODE.'/vigemus/classifier.nvim'
Plug $CODE.'/vigemus/cartographer.nvim'

" Fuzzy v2
Plug $CODE.'/vigemus/picky.nvim'

" Points to where I want
Plug $CODE.'/vigemus/pointer.nvim'

" Make
Plug 'w0rp/ale'

" Filesystem tinkering
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" Project
Plug 'Vigemus/fzf-proj.vim', { 'branch': 'testing' }

" Code commenting
Plug 'scrooloose/nerdcommenter'

" Git stuff
Plug 'mhinz/vim-signify'
Plug 'jreybert/vimagit'
Plug $CODE.'/forks/neogit'
Plug 'lambdalisue/gina.vim'

"Plug 'blackcauldron7/surround.nvim'

" Tpope stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'

" Web requests
Plug 'mattn/webapi-vim'

" Gist
Plug 'mattn/gist-vim'

" Eyecandy
Plug 'kyazdani42/nvim-web-devicons'

" Align
Plug 'tommcdo/vim-lion'

" Fn signatures
Plug 'Shougo/echodoc.vim'

"-- Syntax specific and some more stuff
" Docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

" Lua
Plug 'tbastos/vim-lua'

" Scala
"Plug 'ensime/ensime-vim'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'mdreves/vim-scaladoc', { 'for': 'scala' }

" Scala Build Tool - SBT
Plug 'derekwyatt/vim-sbt', { 'for': 'sbt.scala' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Clojure
Plug $CODE.'/clojure-vim/acid.nvim'
Plug $CODE.'/clojure-vim/jazz.nvim'
Plug $CODE.'/clojure-vim/async-clj-highlight'

Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni'
Plug 'fholiveira/vim-clojure-static', { 'for': 'clojure', 'branch': 'hack-update'}

" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" Nix
Plug 'LnL7/vim-nix'

" Vim - Vader
Plug 'Shougo/neco-vim', { 'for': 'vim' }

" Splunk!
Plug 'vim-scripts/splunk.vim'

" json
Plug 'elzr/vim-json'

" Yaml
Plug 'pedrohdz/vim-yaml-folds'

"Ledger
Plug 'ledger/vim-ledger'

" Fennel
Plug 'bakpakin/fennel.vim'

" Tasks
Plug 'jceb/vim-orgmode'

" Treesitter <3
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'blueyed/vim-diminactive'

Plug 'vito-c/jq.vim'

Plug 'junegunn/goyo.vim'

Plug 'romainl/vim-cool'

Plug 'scy/vim-remind'

"Plan UML
Plug 'aklt/plantuml-syntax'

Plug 'plasticboy/vim-markdown'

call plug#end()

" vi:syntax=vim
