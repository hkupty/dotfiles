call plug#begin('~/.config/nvim/plugged')

" Dark colors
Plug 'nanotech/jellybeans.vim'

" Code Completion
Plug 'shougo/deoplete.nvim'

" Ctags
Plug 'ludovicchabant/vim-gutentags'

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

" Filesystem tinkering
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-dirvish'

" Grep out things
Plug 'mhinz/vim-grepper'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code commenting
Plug 'scrooloose/nerdcommenter'

" Git stuff
Plug 'mhinz/vim-signify'
Plug 'gregsexton/gitv'
Plug 'jreybert/vimagit'

" Tpope stuff
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'

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
Plug 'kovisoft/paredit', { 'for': 'clojure' }
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }

" Python
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Tasks
Plug 'blindFS/vim-taskwarrior', { 'on': 'TW' }

call plug#end()

" vi:syntax=vim
