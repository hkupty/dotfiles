" FIXME fzf hack 'cause fedora sucks
source /opt/code/packages/fzf/plugin/fzf.vim

" deoplete tweaking
source $HOME/.config/nvim/plugins/deoplete.vim

" iron, acid and nvimux tweaking
source $HOME/.config/nvim/plugins/iron_nvimux.vim

" acid tweaking
source $HOME/.config/nvim/plugins/acid.vim

" vim-sexp mappings
source $HOME/.config/nvim/plugins/vim-sexp.vim

" Git integration
source $HOME/.config/nvim/plugins/gina.vim

" ALE
source $HOME/.config/nvim/plugins/ale.vim

" Airline
source $HOME/.config/nvim/plugins/airline.vim

" Switch
source $HOME/.config/nvim/plugins/switch.vim

luafile $HOME/.config/nvim/plugins/pointer.lua

function! HkuptyGetCurrentNreplPort()
  let connection = luaeval("require('acid.connections').get(_A)", getcwd())
  if type(connection) != type(v:null)
    return "nrepl://" . connection[0] . ":" . connection[1]
  endif
  return ""
endfunction

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'nrepl' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gina#component#repo#branch',
      \   'nrepl': 'HkuptyGetCurrentNreplPort'
      \ },
      \ }

let g:fzf#proj#project_dir = '/opt/code/'
let g:fzf#proj#max_proj_depth = 2
let g:fzf#proj#project#open_new_tab = 0

let g:gutentags_ctags_tagfile = ".tags"

let g:signify_vcs_list = [ 'git' ]

let g:python3_host_prog = '/usr/bin/python3'

let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0

let g:pad#dir = "/opt/code/notes"
let g:org_dir = "/opt/code/notes"
let g:pad#default_format = "journal"

let g:twitter_use_rust=1
let g:notes_directories = ["/opt/code/notes/", "/opt/code/books/discrete_math"]

let g:utl_cfg_hdl_scm_http="call system('firefox %u')"

let g:goyo_width="80%"
