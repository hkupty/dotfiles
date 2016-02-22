" Leader as ','
let mapleader = ","

" Me loves ag!
nnoremap <leader>g :Grepper  -tool git -open -noswitch<cr>
nnoremap <leader>a  :Grepper! -tool ag  -open -switch<cr>
nnoremap <leader>k   :Grepper! -tool ack -cword<cr>

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

" CtrlPBuffer

" Refresh me!
map <leader>rr :so $MYVIMRC<CR>

" Clear window
map <leader>o :only<CR>
map <leader><leader> :nohl<CR>

tnoremap <A-]> <C-\><C-n>
tnoremap <C-]> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>

function! InsertTabWrapper(m)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif a:m == 0
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <TAB> <C-R>=InsertTabWrapper(1)<CR>
inoremap <S-TAB> <C-R>=InsertTabWrapper(0)<CR>

" vi:syntax=vim
