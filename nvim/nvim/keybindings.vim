" Leader as ','
let mapleader = ","
let maplocalleader = " "

" rg + fzf ftw
nmap <leader>/ <plug>Grep
nmap <leader>? <plug>GrepAll

" Quick Scope
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)

" Git
nmap <C-M-d> <plug>GitDirty
nmap <C-M-u> <plug>GitUnsynced

vnoremap y myy`y
vnoremap Y myY`y

"normal @a
vnoremap gna :'<,'>normal @a<CR>

nnoremap <C-p> :Files<CR>

" Comment fix
map <leader>c<space> <plug>NERDCommenterToggle

" Quickly toggle lines.
nnoremap <F3> :set number!<CR>:set relativenumber!<CR>
nnoremap <F2> :QuickScopeToggle<CR>

" Edit me!
map <leader>e :tabe $MYVIMRC<CR> :tcd $HOME/.config/nvim/<CR>

" Buffer nav
map <leader>. :Buffers<CR>
map <leader>; :ls<CR>:bd<space>

" Tag Searching
map <leader>t :Tags<CR>

" System clipboard
vnoremap <C-c> "+y

vnoremap <S-Ins> c<C-R>+<ESC>
nnoremap <silent> <S-Ins> :set paste<CR>"+p:set nopaste<CR>
inoremap <silent> <S-Ins> <ESC>:set paste<CR>"+p:set nopaste<CR>a
tnoremap <S-Ins> <C-\><C-n>"+pa

inoremap <C-v> <C-R>+
tnoremap <C-v> <C-\><C-n>"+pa

" Refresh me!
map <leader>rr :so $MYVIMRC<CR>
map <leader>R  :so %<CR>

" Clear window
map <leader>o :only<CR>
map <leader><leader> :nohl<CR>

nnoremap <silent> <leader>% :let g:paredit_mode=!g:paredit_mode<CR>

" Snippets
imap <C-k> <Plug>(neosnippet_jump_or_expand)
smap <C-k> <Plug>(neosnippet_jump_or_expand)
xmap <C-k> <Plug>(neosnippet_jump_or_expand)

tnoremap <C-w>h <C-\><C-n><C-w><C-h>
tnoremap <C-w>j <C-\><C-n><C-w><C-j>
tnoremap <C-w>k <C-\><C-n><C-w><C-k>
tnoremap <C-w>l <C-\><C-n><C-w><C-l>

inoremap <C-w>h <ESC><C-w><C-h>
inoremap <C-w>j <ESC><C-w><C-j>
inoremap <C-w>k <ESC><C-w><C-k>
inoremap <C-w>l <ESC><C-w><C-l>

nnoremap <C-s> :pc<CR>
inoremap <C-s> <ESC>:pc<CR>a

"No arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <S-Up> <NOP>
noremap <S-Down> <NOP>
noremap <S-Left> <NOP>
noremap <S-Right> <NOP>

nmap <C-M-p> <Plug>TcdProjects

map <LocalLeader>fkb :botright vertical 60 split ~/.config/nvim/plugins/vim-sexp.vim<CR>

" vi:syntax=vim
