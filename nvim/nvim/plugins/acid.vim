let g:acid_auto_require = 0
let g:acid_log_messages = 1
let g:acid_namespace = 'user'
let g:acid_eval_command_handler = ['MetaRepl']
let g:acid_project_root = '/opt/code/nu-dev'

function! DoAcidEval()
  let code = join(getline(1, '$'), '\n')
  call AcidSendNrepl({"op": "eval", "code": code}, 'SharedProto')
endfunction

function! MapAcidEval()
  map <buffer> <localleader><CR> :call DoAcidEval()<CR>
endfunction
