command! Clj enew | set ft=clojure bufhidden=wipe buftype=nofile nolist | file *scratch-clj*

au FileType markdown setl spell spelllang=en_us
au FileType org setl spell spelllang=en_us
