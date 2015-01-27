set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Dark colors
Plug 'nanotech/jellybeans.vim'

" Python

" Haskell
Plug 'dag/vim2hs', { 'for': 'haskell' }

" Utilities
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'xolox/vim-misc'
Plug 'mattn/webapi-vim'

" Docker
Plug 'ekalinin/Dockerfile.vim'

" Scala & Gradle
Plug 'tfnico/vim-gradle', { 'for': 'gradle' }

" Git
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'

" NERD Stuff
Plug 'scrooloose/nerdcommenter' 
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" TMUX
Plug 'christoomey/vim-tmux-navigator'

" Make
Plug 'benekastah/neomake'


call plug#end()

" Syntax'n'stuff
syntax on
filetype plugin indent on

" Eyecandy
set background=dark
colorscheme jellybeans

" Some basic stuff
set number
set cursorline
set relativenumber
set hidden

" Airline stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set t_Co=256
set laststatus=2
"set rtp+=$HOME/.local/lib/python3.3/site-packages/powerline/bindings/vim/
set noswapfile
set autowriteall

"Let me save whe focus is out
au FocusLost * silent! wa

" Window remaps
set noswapfile
set autowriteall

au FocusLost * silent! wa

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-R> <C-w>=

" Ease things out
let mapleader = ","
nnoremap ; :

" Python stuff

" Good 'ol search made easy
vmap <leader>a y<esc>:Ag <C-r>"
map <leader>a yiw:Ag <C-r>"

" Python stuff
map <leader>ii iimport ipdb;ipdb.set_trace()<ESC>

" Git stuff
map <leader>gp :call GitPush()<CR>
map <leader>ga :Gstatus<CR>
map <leader>gv :Gitv<CR>

" Comment fix
map <leader>c<space> <plug>NERDCommenterToggle

" Quickly toggle lines.
nnoremap <F2> :set number!<CR>:set relativenumber!<CR>

" Copy selection
vnoremap <C-c> :w !xclip -sel c<CR><ESC>
nnoremap <C-c> viw :w !xclip -sel c<CR><ESC>

" Edit me!
map <leader>e :tabe $MYVIMRC<CR>

" Buffer nav
map <leader>. :ls<CR>:b 

" Refresh me!
map <leader>rr :so $MYVIMRC<CR>

" Clear window
map <leader>o :only<CR>

map <leader><leader> :q!<CR>

" Also, let me have settings per project
set exrc
set secure

augroup filetype_settings
    au!
    au FileType python
        \   set smartindent
        \ | set tabstop=4
        \ | set shiftwidth=4
        \ | set expandtab
        \ | set cc=80
        \ | highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        \ | match OverLength /\%81v.\+/
augroup END
