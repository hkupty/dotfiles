call plug#begin('~/.config/nvim/plugged')

" Dark colors
Plug 'nanotech/jellybeans.vim'
Plug 'sjl/badwolf'
Plug 'baskerville/bubblegum'

" Code Completion
Plug 'shougo/deoplete.nvim'

" Ctags
Plug 'ludovicchabant/vim-gutentags'

" Snippets
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'

" Terminal
Plug 'kassio/neoterm'

" Tmux substitute
Plug 'hkupty/nvimux'

" Split and join
Plug 'hkupty/timeshift.vim'

Plug 'hkupty/iron.nvim'

" Make
Plug 'neomake/neomake'

" Filesystem tinkering
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Grep out things
Plug 'mhinz/vim-grepper'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code commenting
Plug 'scrooloose/nerdcommenter'

" Gutters
Plug 'mhinz/vim-signify'

" Tpope stuff
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-projectionist'

" Web requests
Plug 'mattn/webapi-vim'

" If tables needed be..
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" Code navigation
Plug 'unblevable/quick-scope', { 'on': 'QuickScopeToggle' }
Plug 'terryma/vim-expand-region'
Plug 'wellle/targets.vim'

" Eyecandy
Plug 'ryanoasis/vim-devicons'

"-- Syntax specific and some more stuff
" Docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'docker' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
"Plug 'ensime/ensime-vim'
Plug 'mdreves/vim-scaladoc'

" Scala Build Tool - SBT
Plug 'derekwyatt/vim-sbt'
Plug 'dscleaver/sbt-quickfix'

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" Clojure
Plug 'kovisoft/paredit', {'for': 'clojure'}
Plug 'tpope/vim-fireplace', {'for': 'clojure' }
Plug 'tpope/vim-salve', {'for': 'clojure' }

" Git
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

" Tasks
Plug 'blindFS/vim-taskwarrior'

call plug#end()

" vi:syntax=vim
