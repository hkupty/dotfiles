-- luacheck: globals vim
vim.opt_local.spell = false
vim.treesitter.start()

vim.bo.errorformat = "%t: file://%f:%l:%c %m"
require("znipe").setup()
