let g:deoplete#enable_at_startup = 1

let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tag', 'file', 'neosnippet']
let g:deoplete#sources.clojure = ['acid']

let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns.clojure = '[\w!$%&*+/:<=>?@\^_~\-\.]*'

inoremap <expr><C-@> deoplete#mappings#manual_complete()

autocmd CompleteDone * pclose!

