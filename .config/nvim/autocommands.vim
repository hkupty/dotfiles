" Save on exit
au FocusLost * silent! wa

function s:MapLSP()
  nmap <buffer> <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
  nmap <buffer> <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
  nmap <buffer> <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
  nmap <buffer> <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
  nmap <buffer> <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
  nmap <buffer> <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
  nmap <buffer> <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nmap <buffer> <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nmap <buffer> <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  setl omnifunc=v:lua.vim.lsp.omnifunc
endfunction

" autocmd BufDelete COMMIT_EDITMSG SignifyRefresh

augroup terminal_commands
    au!
    au BufEnter * if &buftype == "terminal" | startinsert | endif
    au TermOpen * setl nonumber norelativenumber scrolloff=0
augroup END

" Project/Language specific config
augroup filetype_settings
    au!
    au FileType xml    setlocal foldmethod=syntax
    au FileType scala  set wildignore+=target/*,project/target/*,*.class
    au FileType java   call s:MapLSP()
    au FileType lua    map <buffer> <leader>R  :call luaeval("hkupty.reluafile(_A)", expand('%:r'))<CR>
    au FileType ledger map <buffer> <localleader><localleader> :call ledger#transaction_statg_toggle(line('.'), ' *?!')<CR>
augroup END

augroup vimrc_autocmds
  autocmd BufEnter org highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter org match OverLength /\%74v.*/
augroup END

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish silent! unmap <buffer> <C-p>
  autocmd FileType dirvish silent! nmap <buffer> <C-c> <Plug>(dirvish_quit)
augroup END


" vi:syntax=vim
