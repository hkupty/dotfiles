vim.keymap.set({'v'}, '<space><space>', function()
  vim.api.nvim_input("<ESC>")
  print(vim.inspect{
      vim.fn.visualmode(),
      vim.fn.getpos("'<'"),
      vim.fn.getpos("'>'"),
      vim.fn.line('v'),
      vim.fn.col('v')
})
end, { silent = true })
