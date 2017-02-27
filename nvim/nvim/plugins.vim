" deoplete tweaking
source $HOME/.config/nvim/plugins/deoplete.vim

" iron, acid and nvimux tweaking
source $HOME/.config/nvim/plugins/iron_nvimux.vim

" acid tweaking
source $HOME/.config/nvim/plugins/acid.vim

" vim-sexp mappings
source $HOME/.config/nvim/plugins/vim-sexp.vim

" fzf
source $HOME/.config/nvim/plugins/fzf.vim

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Dev Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

let g:gutentags_ctags_tagfile = ".tags"

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

let g:python3_host_prog = '/usr/bin/python3'

let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

let g:pad#dir = "/opt/code/notes"
let g:org_dir = "/opt/code/notes"
let g:pad#default_format = "journal"

let g:notes_directories = ["/opt/code/notes/"]
