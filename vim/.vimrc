set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Allmighty Vundle
Plugin 'gmarik/Vundle'

" Dark colors
Plugin 'nanotech/jellybeans.vim'

" Python
Plugin 'klen/python-mode'

" Haskell
Plugin 'dag/vim2hs'

" Scala
Plugin 'ktvoelker/sbt-vim'
Plugin 'derekwyatt/vim-scala'

" Utilities
Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-abolish'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'mattn/webapi-vim'

" Docker
Plugin 'ekalinin/Dockerfile.vim'

" Scala & Gradle
Plugin 'tfnico/vim-gradle'

" Git
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/gist-vim'

" NERD Stuff
Plugin 'scrooloose/nerdcommenter' 
Plugin 'scrooloose/nerdtree'

" TMUX
Plugin 'christoomey/vim-tmux-navigator'

" Snippets!
Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

"Syntastic
Plugin 'scrooloose/syntastic'

call vundle#end()

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
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set cc=80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

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

let g:notes_directories = ['~/m2g/Notes']


" Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
