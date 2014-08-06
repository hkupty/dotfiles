set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'xolox/vim-misc'
Plugin 'klen/python-mode'
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'mhinz/vim-signify'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'tfnico/vim-gradle'
Plugin 'gregsexton/gitv'
Plugin 'scrooloose/nerdcommenter' 
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'

call vundle#end()

" Syntax'n'stuff
syntax on
filetype plugin indent on

" Eyecandy
set background=dark
colorscheme jellybeans

" Some basic stuff
set number
set relativenumber
set hidden

" Airline stuff
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

set t_Co=256
set laststatus=2
set rtp+=$HOME/.local/lib/python3.3/site-packages/powerline/bindings/vim/
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

" Ease things out
let mapleader = ","
nnoremap ; :

" Python stuff
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set cc=80

" Good 'ol search made easy
vmap <leader>a y<esc>:Ag <C-r>"
map <leader>a yiw:Ag <C-r>"

" Git stuff
map <leader>gp :call GitPush()<CR>
map <leader>ga :Gstatus<CR>
map <leader>gv :Gitv<CR>

" Comment fix
map <leader>c<space> <plug>NERDCommenterToggle


" Edit me!
map <leader>e :tabe $MYVIMRC<CR>

" Refresh me!
map <leader>rr :so $MYVIMRC<CR>

" Also, let me have settings per project
set exrc
set secure

" Pymode on!
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_motion = 1
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_signs = 1
let g:pymode_rope = 1

let g:pymode_lint_checkers = ['pep257', 'pylint', 'pyflakes', 'pep8', 'mccabe']

" Airline config
" let g:airline_symbols.branch = ''


