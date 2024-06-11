-- luacheck: globals vim
require("bootstrap")
require("deps")
require("impatient")
require("plugins")

-- [[ configure plugins ]] --
require("config")
require("keybindings")

-- TODO Move to lua
vim.cmd [[source $HOME/.config/nvim/plugins.vim]]

-- Keyboard stuff
-- TODO move to lua
vim.cmd [[source $HOME/.config/nvim/keybindings.vim]]

-- Autostuff done automatically
vim.cmd [[source $HOME/.config/nvim/autocommands.vim]]
