let g:ale_lint_on_text_changed="normal"
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

let g:ale_disable_lsp = 1
let g:ale_linters_ignore = { "java": ["javalsp"]}

let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_virtualtext_cursor = 1
let g:ale_linters_explicit = 1

let g:ale_fix_on_save = 1

let g:ale_linters = {
  \ "java": ["pmd"],
  \ "markdown": ["writegood"],
  \ "lua": ["luacheck"],
  \ "sh": ["shellcheck"],
  \}

let g:ale_fixers = {
  \ "*": ['remove_trailing_lines', 'trim_whitespace'],
  \ "go": ['gofmt'],
  \ }

let g:ale_linter_aliases = {
    \ "markdown": "r",
    \ "org": "markdown",
  \}

let g:ale_java_google_java_format_options = '--aosp --replace'

let g:ale_sh_shellcheck_options="-e SC2154"

let g:ale_lua_luacheck_options="--std lua51"

"let g:ale_writegood_options = "--yes-eprime"
let g:ale_writegood_options = ""
let g:ale_scalastyle_config_loc = "$HOME/.config/scalastyle/"
"let g:ale_scalastyle_config_loc = "$HOME/.config/scalastyle/scalastyle_config.xml"
