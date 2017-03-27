" Save on exit
au FocusLost * silent! wa

autocmd BufDelete COMMIT_EDITMSG SignifyRefresh

augroup terminal_commands
    au!
    au BufEnter * if &buftype == "terminal" | startinsert | endif
augroup END

" Project/Language specific config
augroup filetype_settings
    au!
    au FileType *
        \   set cc=0
    au FileType python
        \   let python_highlight_all = 1
        \ | set cc=80
        \ | highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        \ | match OverLength /\%81v.\+/
        \ | map <leader>ii i import ipdb;ipdb.set_trace()<ESC>
        \ | set autoindent
        \ | set smartindent
        \ | set textwidth=79
    au FileType scala
        \   set wildignore+=target/*,project/target/*,*.class
    au FileType ledger
        \   map <buffer> <localleader><localleader> :call ledger#transaction_state_toggle(line('.'), ' *?!')<CR>
augroup END

"au TabEnter * if exists('t:cschm') && t:cschm != colors_name | exe 'colors' t:cschm | else | exe 'colors' default_colorscheme | endif

" vi:syntax=vim
