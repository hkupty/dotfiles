" Leader as ','
let mapleader = ","

" Me loves ag!
nnoremap <leader>g :Grepper -tool git -open -noswitch<cr>
nnoremap <leader>a :Grepper -tool ag  -open -switch<cr>

" Git
nnoremap gs :Gstatus<CR>
nnoremap gvs :Gvdiff<CR>

" Comment fix
map <leader>c<space> <plug>NERDCommenterToggle
nmap <silent> <special> <F2> :NERDTreeToggle<RETURN>

" Quickly toggle lines.
nnoremap <F3> :set number!<CR>:set relativenumber!<CR>

" Edit me!
map <leader>e :tabe $MYVIMRC<CR>

" Buffer nav
map <leader>. :CtrlPBuffer<CR>
map <leader>; :ls<CR>:bd<space>

" Tag Searching
map <leader>l :CtrlPBufTag<CR>
map <leader>k :CtrlPBufTagAll<CR>
map <leader>t :CtrlPTag<CR>

" Refresh me!
map <leader>rr :so $MYVIMRC<CR>

" Clear window
map <leader>o :only<CR>
map <leader><leader> :nohl<CR>

" Expand Region
vmap <A-k> <Plug>(expand_region_expand)
vmap <A-j> <Plug>(expand_region_shrink)

" Snippets
imap <C-k> <Plug>(neosnippet_jump_or_expand)
smap <C-k> <Plug>(neosnippet_jump_or_expand)
xmap <C-k> <Plug>(neosnippet_jump_or_expand)

if exists('$TMUX')
  tnoremap <A-]> <C-\><C-n>
  tnoremap <C-]> <C-\><C-n>
  tnoremap <C-h> <C-\><C-n><C-w><C-h>
  tnoremap <C-j> <C-\><C-n><C-w><C-j>
  tnoremap <C-k> <C-\><C-n><C-w><C-k>
  tnoremap <C-l> <C-\><C-n><C-w><C-l>
endif

" vi:syntax=vim
