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
let g:ctrlp_switch_buffer = 0
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

" vim-grepper's config
command! -nargs=* -complete=file GG Grepper -tool git -query <args>
command! -nargs=* -complete=file Ag Grepper -tool ag -query <args>

" Dev Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1

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

let g:nvimux_no_neoterm = 1
let g:nvimux_open_term_by_default = 1

"au VimEnter * if &columns > 200 => set vertical else set horizontal
let g:nvimux_quickterm_direction = 'botright'
let g:nvimux_quickterm_orientation = 'vertical'
let g:nvimux_quickterm_scope = 't'
let g:nvimux_quickterm_size = '80'

function! ToggleRepl() abort
  let s:var = "g:iron_".&ft."_repl"
  call NvimuxRawToggle(s:var, "IronRepl")
endfunction

let g:nvimux_custom_bindings = [
  \['s', ':NvimuxHorizontalSplit<CR>', ['n', 'v', 'i', 't']],
  \['v', ':NvimuxVerticalSplit<CR>', ['n', 'v', 'i', 't']],
  \['$', ':call ToggleRepl()<CR>', ['n', 'v', 'i', 't']]
\]

" vi:syntax=vim
