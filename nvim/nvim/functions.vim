function! DeglobPath(base)
  let @a=""
  let @b=""
  let @c=""
  normal "by0
  normal "ct<space>
  normal maf<space>"ay$
  return join(map(globpath(a:base, @c, v:false, v:true), '@b . v:val . @a'), "\n")
endfunction
