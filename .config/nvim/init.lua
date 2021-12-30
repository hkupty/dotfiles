-- luacheck: globals vim
require("deps")
require("globals")
require("plugins")
require("plugins.orgmode")
require("plugins.treesitter")
require("plugins.expressline")
require("plugins.telescope")
require("plugins.telescope")
require("config")
require("keybindings")


vim.cmd [[source $HOME/.config/nvim/config.vim]]

vim.cmd [[source $HOME/.config/nvim/plugins.vim]]

-- Config defaults

-- Filetype specific stuff
vim.cmd [[source $HOME/.config/nvim/ft.vim]]

-- Keyboard stuff
vim.cmd [[source $HOME/.config/nvim/keybindings.vim]]

-- Autostuff done automatically
vim.cmd [[source $HOME/.config/nvim/autocommands.vim]]

-- Config plugins in lua
