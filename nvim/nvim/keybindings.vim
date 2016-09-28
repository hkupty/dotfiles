" Leader as ','
let mapleader = ","

" Me loves ag!
nnoremap <leader>g :Grepper -tool git -open -noswitch<cr>
nnoremap <leader>a :Grepper -tool ag  -open -switch<cr>
nnoremap <leader>/ :Grepper -tool rg  -open -switch<cr>

" Quick Scope
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)

" Git
nnoremap gs :Gstatus<CR>
nnoremap gvs :Gvdiff<CR>

vnoremap y myy`y
vnoremap Y myY`y

"normal @a
vnoremap gna :'<,'>normal @a<CR>

" Comment fix
map <leader>c<space> <plug>NERDCommenterToggle

" Quickly toggle lines.
nnoremap <F3> :set number!<CR>:set relativenumber!<CR>
nnoremap <F2> :QuickScopeToggle<CR>

" Edit me!
map <leader>e :tabe $MYVIMRC<CR>

" Buffer nav
map <leader>. :CtrlPBuffer<CR>
map <leader>; :ls<CR>:bd<space>

" Tag Searching
map <leader>l :CtrlPBufTag<CR>
map <leader>k :CtrlPBufTagAll<CR>
map <leader>t :CtrlPTag<CR>

" System clipboard
nnoremap <C-c> "+y
vnoremap <C-c> "+y

" Refresh me!
map <leader>rr :so $MYVIMRC<CR>
map <leader>R  :so %<CR>

" Clear window
map <leader>o :only<CR>
map <leader><leader> :nohl<CR>

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

" vi:syntax=vim
