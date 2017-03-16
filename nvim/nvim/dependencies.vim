call plug#begin('~/.config/nvim/plugged')

" Dark colors
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'ayu-theme/ayu-vim', { 'frozen': 1 }

" Code Completion
Plug 'shougo/deoplete.nvim'
Plug 'Shougo/denite.nvim'

" Ctags
Plug 'hkupty/vim-gutentags', { 'branch': 'new-fix-tcd' }

" Snippets
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'

" Tmux substitute
Plug 'hkupty/nvimux'

" Split and join
Plug 'hkupty/timeshift.vim'

" Repls
Plug 'hkupty/iron.nvim', { 'branch': 'testing' }

" Make
Plug 'neomake/neomake'

" Cool search stuff
Plug 'romainl/vim-cool'

" Filesystem tinkering
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" Project
Plug 'hkupty/fzf-proj.vim', { 'branch': 'testing' }

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code commenting
Plug 'scrooloose/nerdcommenter'

" Git stuff
Plug 'mhinz/vim-signify'
"Plug 'jreybert/vimagit'
Plug 'jreybert/vimagit', { 'branch': 'next' }

Plug 'vim-scripts/AnsiEsc.vim'

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
Plug 'unblevable/quick-scope', { 'on': 'QuickScopeToggle' }

" Eyecandy
Plug 'ryanoasis/vim-devicons'

" Align
Plug 'tommcdo/vim-lion'

"-- Syntax specific and some more stuff
" Docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'mdreves/vim-scaladoc', { 'for': 'scala' }

" Scala Build Tool - SBT
Plug 'derekwyatt/vim-sbt', { 'for': 'sbt.scala' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Clojure
Plug 'guns/vim-sexp', { 'for': 'clojure' }
Plug 'clojure-vim/acid.nvim', { 'branch': 'testing' }
Plug 'clojure-vim/async-clj-omni'
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }

" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Vim - Vader
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'junegunn/vader.vim'

"Notes and stuff
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'fmoralesc/vim-pad'
Plug 'vim-scripts/utl.vim'
Plug 'sotte/presenting.vim'
Plug 'amerlyq/nou.vim'
Plug 'junegunn/vim-journal'

Plug 'vim-scripts/splunk.vim'

"Ledger
Plug 'ledger/vim-ledger'

" Tasks
Plug 'blindFS/vim-taskwarrior', { 'on': 'TW' }

call plug#end()

" vi:syntax=vim
