" Leader as ','
let mapleader = ","
let maplocalleader = " "

" rg + fzf ftw
nmap <leader>S :exec "let cft=&ft \| edit scratchpad \| let &ft=cft"<CR>

" Quick Scope
nmap <leader>q <plug>(QuickScopeToggle)
vmap <leader>q <plug>(QuickScopeToggle)

" Git
nmap <C-M-d> <plug>GitDirty
nmap <C-M-u> <plug>GitUnsynced

vnoremap Y myY`y

"normal @a
vnoremap gna :'<,'>normal @a<CR>

" Git
nnoremap gb :Gina branch<CR>
nnoremap gB :Gina blame :<CR>

" Comment fix
map <leader>c<space> <plug>NERDCommenterToggle

" Quickly toggle lines.
nnoremap <silent> <F3> :set number! relativenumber!<CR>
nnoremap <F2> :QuickScopeToggle<CR>

" Edit me!
map <leader>e :tabe $MYVIMRC<CR>:tcd $HOME/.config/nvim/<CR>
map <leader>z :tabe $HOME/.zshrc<CR>:tcd $HOME<CR>

" Buffer nav
map <leader>. :Buffers<CR>
map <leader>; :ls<CR>:bd<space>

" Tag Searching
map <leader>t :Tags<CR>

" Term(ify) the current window
map g! :term<CR>

" System clipboard
vnoremap <C-c> "+y

vnoremap <S-Ins> c<C-R>+<ESC>
nnoremap <silent> <S-Ins> :set paste<CR>"+p:set nopaste<CR>
inoremap <silent> <S-Ins> <C-R>+
tnoremap <S-Ins> <C-\><C-n>"+pa

inoremap <silent> <C-v> <ESC>:set paste<CR>"+p:set nopaste<CR>a
tnoremap <silent> <C-v> <C-\><C-n>"+pa

" Refresh me!
map <leader>rr :so $MYVIMRC<CR>
map <leader>R  :so %<CR>

" Clear window
map <silent> <leader><down> :call Grab()<CR>
map <silent> <leader>o :only<CR>
map <silent> <leader><leader> :nohl<CR>

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

nmap <C-w><C-w> <Cmd>silent ! gtk-launch nvim-appimage<CR>

nmap <C-M-p> <Cmd>lua _.cartographer.project()<CR>
nmap <C-f> <Cmd>lua _.cartographer.cd()<CR>
nmap <C-p> <Cmd>lua _.cartographer.files{}<CR>
nmap <C-g> <Cmd>lua _.cartographer.dirty()<CR>
nmap <C-l> <Cmd>lua _.cartographer.buffers{}<CR>
nmap <M-v> <Cmd>lua _.cartographer.files("leftabove vnew")<CR>
nmap <M-h> <Cmd>lua _.cartographer.files("rightbelow new")<CR>
nmap <C-t> <Cmd>lua _.cartographer.todo("rightbelow new")<CR>
nmap <C-t> <Cmd>lua _.cartographer.todo("rightbelow new")<CR>
nmap <leader>/ <Cmd>lua grep()<CR>
nmap <leader>? <plug>GrepAll


nmap <C-space> <Cmd>Goyo<CR>

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-H> <S-Left>
cnoremap <C-L> <S-Right>
cnoremap <C-V> <C-R>+

map <LocalLeader>kb :botright vertical 60 split ~/.config/nvim/plugins/vim-sexp.vim<CR>
" vi:syntax=vim
