" Save on exit
au FocusLost * silent! wa

autocmd BufDelete COMMIT_EDITMSG SignifyRefresh

augroup terminal_commands
    au!
    au BufEnter * if &buftype == "terminal" | startinsert | endif
    au TermOpen * setl nonumber norelativenumber
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
        \ | map <buffer> <leader>ii i import ipdb;ipdb.set_trace()<ESC>
        \ | set autoindent
        \ | set smartindent
        \ | set textwidth=79
    au FileType scala
        \   set wildignore+=target/*,project/target/*,*.class
    au FileType lua
        \   map <buffer> <leader>R  :luafile %<CR>
    au FileType ledger
        \   map <buffer> <localleader><localleader> :call ledger#transaction_statg_toggle(line('.'), ' *?!')<CR>
augroup END

augroup Fixes
    au!
    au GuiEnter *
       \   tunmap <ESC>
       \ | color base16-default-dark
augroup END

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END

augroup nvr
  autocmd!
  autocmd VimEnter * call Grab()
augroup END

" vi:syntax=vim
