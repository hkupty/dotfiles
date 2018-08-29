
function! SplitXml(motion) abort
    let split = "s/\(<.*\/.*>\)</\1\r<"
    if a:motion == ""
        exec "global/".split
    elseif a:motion == "line"
        exec "'<'>".split
    else
        exec "`<`>".split
    endif
endfunction

"au FileType xml,html nmap <silent> sx :set opfunc=SplitXml<CR>g@
"au FileType xml,html vmap <silent> sx :<C-U>call SplitXml(visualmode())
