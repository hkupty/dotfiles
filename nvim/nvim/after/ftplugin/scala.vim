function! ScalaSearch()
  call inputsave()
  let pattern = input("Symbol")
  call inputrestore()
  exec "EnSearch" pattern
endfunction

nnoremap <buffer> <silent> <LocalLeader>t :EnType<CR>
xnoremap <buffer> <silent> <LocalLeader>t :EnType selection<CR>
nnoremap <buffer> <silent> <LocalLeader>T :EnTypeCheck<CR>

nnoremap <buffer> <silent> K  :EnDocBrowse<CR>
nnoremap <buffer> <silent> gd :EnDeclaration<CR>

nnoremap <buffer> <silent> <C-/> :call ScalaSearch()<CR>

nnoremap <buffer> <silent> <C-]> :EnDeclaration<CR>
nnoremap <buffer> <silent> <C-w><C-]> :EnDeclarationSplit<CR>
nnoremap <buffer> <silent> <C-v><C-]> :EnDeclarationSplit v<CR>

nnoremap <buffer> <silent> <LocalLeader>i :EnInspectType<CR>
nnoremap <buffer> <silent> <LocalLeader>I :EnSuggestImport<CR>
nnoremap <buffer> <silent> <LocalLeader>o :EnOrganizeImports<CR>
nnoremap <buffer> <silent> <LocalLeader>r :EnRename<CR>
