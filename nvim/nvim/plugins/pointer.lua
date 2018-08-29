-- luacheck: globals vim
local nvim = vim.api
local pointer = require("pointer")

pointer.config{
  truecaller = {
    url = pointer.formatters.url.opengrok("https://opengrok.truecaller.net/xref/")
  },
  url = pointer.formatters.url.github
}

pointer.map{}

nvim.nvim_command([[function! PointAtUrl(m, ...)
  if a:0
    lua require("pointer").bind("from_visual", "url", "to_clip")
  else
    lua require("pointer").bind("from_motion", "url", "to_clip")
  endif
endfunction]])


nvim.nvim_command("nmap <silent> yr <Cmd>set opfunc=PointAtUrl<CR>g@")
nvim.nvim_command("vmap <silent> yu :<C-U>call PointAtUrl(visualmode(), 1)<CR>")
