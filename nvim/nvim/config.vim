set background=dark

set termguicolors

let g:default_colorscheme = 'ayu'

colors ayu

" Theme tweaking
hi TermCursor ctermfg=red

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
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set fillchars=vert:\│,fold:\─

let g:terminal_scrollback_buffer_size=9999999

" vi:syntax=vim
