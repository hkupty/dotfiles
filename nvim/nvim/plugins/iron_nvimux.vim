let g:nvimux_open_term_by_default = 1
let g:nvimux_new_window_buffer = 'single'
let g:nvimux_quickterm_direction = 'botright'
let g:nvimux_quickterm_orientation = 'vertical'
let g:nvimux_quickterm_scope = 't'
let g:nvimux_quickterm_size = '80'

function! s:escape_ft(ft)
  return substitute(a:ft, "\\.", "_", "")
endfunction

let g:iron_repl_open_cmd = "topleft vspl"

function! SetNvimuxConfigOnIronRepl(buf_id, repl_def) abort
  exec "let t:iron_" . s:escape_ft(a:repl_def.ft) . "_repl = " . a:buf_id
  call setbufvar(a:buf_id, 'nvimux_buf_orientation', g:iron_repl_open_cmd)
endfunction

function! SetNvimuxConfigOnShell(buf_id, repl_def) abort
  let orientation = g:nvimux_quickterm_direction . " " . g:nvimux_quickterm_orientation . " " . g:nvimux_quickterm_size . "split"
  call setbufvar(a:buf_id, 'nvimux_buf_orientation', orientation)
endfunction

let g:iron_new_repl_hooks = ['SetNvimuxConfigOnIronRepl']
let g:iron_new_sh_repl_hooks = ['SetNvimuxConfigOnShell']
let g:iron_debug = 1

let g:nvimux_custom_bindings = [
  \['s', ':NvimuxHorizontalSplit<CR>', ['n', 'v', 'i', 't']],
  \['v', ':NvimuxVerticalSplit<CR>', ['n', 'v', 'i', 't']],
  \['!', ':IronPromptRepl<CR>', ['n', 'v', 'i', 't']],
  \['$', ':IronRepl<CR>', ['n', 'v', 'i', 't']],
  \['#', ':IronPromptCommand<CR>', ['n', 'v', 'i', 't']],
  \['%', ':call ToggleRepl()<CR>', ['n', 'v', 'i', 't']]
\]

let g:nvimux_new_term = "call IronStartRepl('sh', 0, 1)"
