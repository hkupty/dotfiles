call plug#begin('~/.config/nvim/plugged/')

Plug 'bfredl/nvim-luadev'

" GUI stuff
Plug 'equalsraf/neovim-gui-shim'

" Dark colors
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'
Plug 'colepeters/spacemacs-theme.vim'

" Code Completion
Plug 'shougo/deoplete.nvim'

" Let on modeline
Plug 'vim-scripts/let-modeline.vim'

" Ctags
Plug 'ludovicchabant/vim-gutentags'

" TODO: remove
Plug $CODE.'/KillTheMule/nvimpam'

" Snippets
"Plug 'shougo/neosnippet.vim'
"Plug 'shougo/neosnippet-snippets'

" Match stuff
"Plug 'andymass/vim-matchup'

" Parenthesis matchup
Plug 'tmsvg/pear-tree'

" Text cycling
Plug 'AndrewRadev/switch.vim'

" Tmux substitute
Plug $CODE.'/vigemus/nvimux'

" Split and join
Plug 'Vigemus/timeshift.vim'

" Repls
Plug $CODE.'/vigemus/iron.nvim'
Plug $CODE.'/vigemus/trex.nvim'

" Prompt utils
Plug $CODE.'/vigemus/impromptu'

" Project Navigation
Plug $CODE.'/vigemus/cartographer.nvim'

" Fuzzy v2
Plug $CODE.'/vigemus/picky.nvim'

" Points to where I want
Plug $CODE.'/vigemus/pointer.nvim'

" Make
Plug 'w0rp/ale'

" Twitter
Plug 'vmchale/vim-twitter'

" Cool search stuff
Plug 'romainl/vim-cool'

" Filesystem tinkering
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" Project
Plug 'Vigemus/fzf-proj.vim', { 'branch': 'testing' }

" Code commenting
Plug 'scrooloose/nerdcommenter'

" Git stuff
Plug 'mhinz/vim-signify'
Plug 'jreybert/vimagit', { 'branch': 'next' }
Plug 'lambdalisue/gina.vim'

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

" Code navigation
"Plug 'unblevable/quick-scope'

" Eyecandy
Plug 'ryanoasis/vim-devicons'

" Align
Plug 'tommcdo/vim-lion'

" LSP client
"Plug 'autozimu/LanguageClient-neovim'

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

Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'clojure-vim/async-clj-omni'
Plug 'fholiveira/vim-clojure-static', { 'for': 'clojure', 'branch': 'hack-update'}
Plug 'clojure-vim/async-clj-highlight', { 'for': 'clojure', 'branch': 'acid-autocmd' }

" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Nix
Plug 'LnL7/vim-nix'

" Vim - Vader
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'junegunn/vader.vim'

" Splunk!
Plug 'vim-scripts/splunk.vim'

" json
Plug 'elzr/vim-json'

"Ledger
Plug 'ledger/vim-ledger'

" Tasks
Plug 'jceb/vim-orgmode'
Plug 'vim-scripts/utl.vim'
Plug 'blindFS/vim-taskwarrior', { 'on': 'TW' }

Plug 'ElmCast/elm-vim', { 'for': 'elm' }

Plug 'vito-c/jq.vim'

Plug 'scy/vim-remind'
call plug#end()

" vi:syntax=vim
