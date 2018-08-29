function! Grab()
  if ! empty(v:servername)
    lua << EOF
      local server = io.open('/tmp/nvim-server', 'w')
      server:write(vim.api.nvim_get_vvar('servername'))
      server:close()
EOF
  endif
endfunction

function! OpenAt(side)
  let olds = @s
  normal $"syiW
  if a:side ==? "left"
    exec "topleft vertical split " @s
  else
    exec "botright vertical split " @s
  endif
  let @s = olds
endfunction
