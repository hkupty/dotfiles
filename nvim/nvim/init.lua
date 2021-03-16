require("deps")
require("globals")
require("plugins")
-- require("plugins.treesitter")
require("plugins.expressline")
require("plugins.bordet")
-- require("config")
require("project")
require("tasks")
require("keybindings")


vim.cmd [[source $HOME/.config/nvim/plugins.vim]]

-- Config defaults
vim.cmd [[source $HOME/.config/nvim/config.vim]]

-- Filetype specific stuff
vim.cmd [[source $HOME/.config/nvim/ft.vim]]

-- Keyboard stuff
vim.cmd [[source $HOME/.config/nvim/keybindings.vim]]

-- Autostuff done automatically
vim.cmd [[source $HOME/.config/nvim/autocommands.vim]]

-- Config plugins in lua
