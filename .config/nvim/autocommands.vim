" Save on exit
au FocusLost * silent! wa

augroup terminal_commands
    au!
    au TermOpen * setl nonumber norelativenumber scrolloff=0
augroup END

" Project/Language specific config
augroup filetype_settings
    au!
    au FileType scala  set wildignore+=target/*,project/target/*,*.class
    au FileType ledger map <buffer> <localleader><localleader> :call ledger#transaction_statg_toggle(line('.'), ' *?!')<CR>
augroup END

augroup vimrc_autocmds
  autocmd BufEnter org highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter org match OverLength /\%74v.*/
augroup END


" vi:syntax=vim
