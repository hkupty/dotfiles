set background=dark

colors jellybeans

" Term cursor highlight
hi TermCursor ctermfg=red

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

" Default copy is equals to <C-c>
set clipboard=unnamedplus

" vi:syntax=vim
