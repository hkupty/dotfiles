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

let g:ale_writegood_options = "--yes-eprime"
let g:ale_scalastyle_config_loc = "$HOME/.config/scalastyle/"
"let g:ale_scalastyle_config_loc = "$HOME/.config/scalastyle/scalastyle_config.xml"
