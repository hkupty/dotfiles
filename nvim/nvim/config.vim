set background=dark

colors jellybeans

" Term cursor highlight
hi TermCursor ctermfg=red

hi VertSplit ctermbg=bg
hi EndOfBuffer ctermfg=bg

set noreadonly

" Better nav
set number
set cursorline
set relativenumber
set hidden

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

" Make whitespaces visible
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set fillchars=vert:\│,fold:\─

let g:terminal_scrollback_buffer_size=9999999

" vi:syntax=vim
