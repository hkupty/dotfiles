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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Tmux substitute
Plug 'hkupty/nvimux'

" Terminal
Plug 'kassio/neoterm'

" Filesystem tinkering
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Grep out things
Plug 'mhinz/vim-grepper'

" Beauty airline
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

" Misc
Plug 'xolox/vim-misc'

" Web requests
Plug 'mattn/webapi-vim'

" If tables needed be..
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" Clipboard
Plug 'cazador481/fakeclip.neovim'

" Better start screen
Plug 'mhinz/vim-startify'

" Code navigation
Plug 'unblevable/quick-scope'
Plug 'terryma/vim-expand-region'

" Eyecandy
Plug 'ryanoasis/vim-devicons'

"-- Syntax specific and some more stuff
" Docker
Plug 'ekalinin/Dockerfile.vim', { 'for': 'docker' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'spiroid/vim-ultisnip-scala'
"Plug 'ensime/ensime-vim'
Plug 'mdreves/vim-scaladoc'

" Scala Build Tool - SBT
Plug 'derekwyatt/vim-sbt'
Plug 'dscleaver/sbt-quickfix'

" Rust
Plug 'rust-lang/rust.vim'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-salve'
Plug 'kovisoft/paredit'

" Git
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

" TMUX
Plug 'christoomey/vim-tmux-navigator'

" Tasks
Plug 'farseer90718/vim-taskwarrior'

" Make
Plug 'benekastah/neomake'

" Front
Plug 'digitaltoad/vim-jade'
Plug 'mattn/emmet-vim'

" One day those might work
" Plug 'jaxbot/github-issues.vim'

call plug#end()

" vi:syntax=vim
