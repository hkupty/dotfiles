set background=dark

set termguicolors

if has("nvim-0.4.0")
  colorscheme space-vim-dark
else
  colorscheme base16-classic-dark
endif

set noreadonly

" Better nav
set number
set relativenumber
set cursorline
set scrolloff=8
set hidden

" Indent
set autoindent
set smartindent
set smartcase

" Base sanity stuff
set noswapfile
set autowriteall
set writeany

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

set noshowmode
set laststatus=0
set noshowcmd
set mouse=a

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

let $FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*" --glob "!target/*"'

set tags=*/.tags;.tags

"call serverstart("127.0.0.1:12345")

" vi:syntax=vim
