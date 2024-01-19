-- luacheck: globals vim
require("oil").setup {
  keymaps = {
    ["<C-p>"] = false,
  }
}

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "oil_preview",
  callback = function(params)
    vim.keymap.set("n", "y", "o", { buffer = params.buf, remap = true, nowait = true })
  end
})
