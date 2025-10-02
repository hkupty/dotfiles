let g:deoplete#enable_at_startup = 1

call deoplete#custom#option('sources', {
      \ '_': ['file', 'neosnippet'],
      \ 'clojure': ['acid'],
      \ 'java': ['lsp', 'javacomplete2', 'neosnippet'],
      \ 'kotlin': ['lsp', 'neosnippet'],
      \ })

let g:deoplete#lsp#use_icons_for_candidates = v:true

call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})

call deoplete#custom#option({'auto_complete': v:true})

call deoplete#custom#option('omni_patterns', {
\ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
\ 'java': '[^. *\t]\.\w*',
\ 'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
\ 'xhtml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
\ 'xml': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],
\})

call deoplete#custom#source('_',  'max_info_width', 0)

inoremap <expr><C-@> deoplete#mappings#manual_complete()

autocmd CompleteDone * pclose!
