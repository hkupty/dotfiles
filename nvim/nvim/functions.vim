function! Grab()
  if ! empty(v:servername)
    lua << EOF
      local server = io.open('/tmp/nvim-server', 'w')
      server:write(vim.api.nvim_get_vvar('servername'))
      server:close()
EOF
  endif
endfunction


