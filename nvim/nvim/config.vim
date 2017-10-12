set background=dark

set termguicolors

colors base16-default-dark

source $HOME/.config/nvim/color.vim

set noreadonly

" Better nav
set number
set cursorline
set relativenumber
set hidden

" Indent

set autoindent
set smartindent

" Base sanity stuff
set laststatus=2
set noswapfile
set autowriteall

" Also, let me have settings per project
set exrc
set secure

" Global taboptions
set tabstop=2
set shiftwidth=2
set expandtab

" Option complete
set wildmode=full

" Live substitution
set inccommand=split


" Make whitespaces visible
set list listchars=tab:⇥⋅,trail:⋅,nbsp:⋅
set fillchars=vert:\│,fold:\─

let g:terminal_scrollback_buffer_size=9999999

" Disable a lot of stuff
let g:loaded_2html_plugin = 1
let g:loaded_gzip = 1
let g:loaded_tarPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_netrwPlugin = 1

let g:is_bash = 1

" XML folding config
let g:xml_syntax_folding=1
au FileType xml,lua setlocal foldmethod=syntax

" vi:syntax=vim
