" Save on exit
au FocusLost * silent! wa

" Make on save
autocmd! BufWritePost * Neomake

autocmd BufDelete COMMIT_EDITMSG SignifyRefresh

augroup terminal_commands
    au!
    au BufEnter * if &buftype == "terminal" | startinsert | endif
augroup END

" Project/Language specific config
augroup filetype_settings
    au!
    au FileType python
        \   let python_highlight_all = 1
        \ | set cc=80
        \ | highlight OverLength ctermbg=red ctermfg=white guibg=#592929
        \ | match OverLength /\%81v.\+/
        \ | map <leader>ii i import ipdb;ipdb.set_trace()<ESC>
        \ | set autoindent
        \ | set smartindent
        \ | set textwidth=79
    au FileType clojure
        \ call PareditInitBuffer()
    au FileType scala
        \   set wildignore+=target/*,project/target/*,*.class
augroup END

" vi:syntax=vim
