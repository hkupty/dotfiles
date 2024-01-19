vnoremap Y myY`y

"normal @a
vnoremap gna :'<,'>normal @a<CR>

" Snippets
tnoremap <C-w>h <C-\><C-n><C-w><C-h>
tnoremap <C-w>j <C-\><C-n><C-w><C-j>
tnoremap <C-w>k <C-\><C-n><C-w><C-k>
tnoremap <C-w>l <C-\><C-n><C-w><C-l>

inoremap <C-w>h <ESC><C-w><C-h>
inoremap <C-w>j <ESC><C-w><C-j>
inoremap <C-w>k <ESC><C-w><C-k>
inoremap <C-w>l <ESC><C-w><C-l>

nnoremap <silent> <C-s>s :exec 'tcd '.expand('%:h')<CR>
nnoremap <silent> <C-s>u :exec 'tcd '.getcwd(0,0).'/..'<CR>

"No arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <S-Up> <NOP>
noremap <S-Down> <NOP>
noremap <S-Left> <NOP>
noremap <S-Right> <NOP>

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-H> <S-Left>
cnoremap <C-L> <S-Right>
cnoremap <C-V> <C-R>+

map <LocalLeader>kb :botright vertical 60 split ~/.config/nvim/plugins/vim-sexp.vim<CR>
" vi:syntax=vim
