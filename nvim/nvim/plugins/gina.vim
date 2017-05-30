call gina#custom#mapping#nmap(
      \ 'branch', 'D',
      \ '<Plug>(gina-branch-delete)'
      \)

call gina#custom#mapping#nmap(
      \ 'branch', 'C',
      \ '<Plug>(gina-branch-new)'
      \)

call gina#custom#mapping#nmap(
      \ '/.*', 'q',
      \ ':q<CR>'
      \)
