" deoplete tweaking
source $HOME/.config/nvim/plugins/deoplete.vim

" iron, acid and nvimux tweaking
source $HOME/.config/nvim/plugins/iron_nvimux.vim

" acid tweaking
source $HOME/.config/nvim/plugins/acid.vim


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" vim-grepper's config
command! -nargs=* -complete=file GG Grepper -tool git -query <args>
command! -nargs=* -complete=file Ag Grepper -tool ag -query <args>

" Dev Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

let g:gutentags_tagfile = ".tags"

function! neomake#makers#ft#scala#scalastyle()
    return {
        \ 'args': [
            \ '--config', '$HOME/.config/scalastyle/scalastyle_config.xml'
        \ ],
        \ 'errorformat':
            \ '%trror file=%f message=%m line=%l column=%c,' .
            \ '%trror file=%f message=%m line=%l,' .
            \ '%tarning file=%f message=%m line=%l column=%c,' .
            \ '%tarning file=%f message=%m line=%l'
        \ }
endfunction

let g:signify_vcs_list = [ 'git' ]

let g:gutentags_tagfile = ".tags"

let g:python3_host_prog = '/usr/bin/python3'

let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" vi:syntax=vim
