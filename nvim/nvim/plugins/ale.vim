let g:ale_lint_on_text_changed="never"
let g:ale_virtualtext_cursor=1
let g:ale_lint_on_insert_leave=1

let g:ale_sh_shellcheck_options="-e SC2154"

let g:ale_lua_luacheck_options="--std lua51"

let g:ale_fixers = { "java": [
                 \     'remove_trailing_lines',
                 \     'trim_whitespace'
                 \   ],
                 \ }
let g:ale_fix_on_save = 1

"let g:ale_writegood_options = "--yes-eprime"
let g:ale_writegood_options = ""
let g:ale_scalastyle_config_loc = "$HOME/.config/scalastyle/"
"let g:ale_scalastyle_config_loc = "$HOME/.config/scalastyle/scalastyle_config.xml"

