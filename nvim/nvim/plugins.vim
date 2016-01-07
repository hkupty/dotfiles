" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><C-@> deoplete#mappings#manual_complete()

" NERDTree
let NERDTreeIgnore = ['\.pyc$']

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf' 

" Ctrl-p
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Expand Region
map K <Plug>(expand_region_expand)
map <C-K> <Plug>(expand_region_shrink)

" vim-grepper's config
command! -nargs=* -complete=file GG Grepper! -tool git -query <args>
command! -nargs=* -complete=file Ag Grepper! -tool ag -query <args>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"

" Dev Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1

" vi:syntax=vim
