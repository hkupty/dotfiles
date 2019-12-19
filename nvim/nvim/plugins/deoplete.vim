let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
      \ '_': ['file', 'neosnippet'],
      \ 'clojure': ['acid'],
      \ 'java': ['javacomplete2', 'neosnippet'],
      \ })

call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})

call deoplete#custom#source('_',  'max_info_width', 0)

inoremap <expr><C-@> deoplete#mappings#manual_complete()

autocmd CompleteDone * pclose!
