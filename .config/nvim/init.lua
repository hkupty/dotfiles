-- luacheck: globals vim
require("deps")
require("globals")
require("plugins")
require("plugins.cmp")
require("plugins.gitsigns")
require("plugins.iron")
require("plugins.lsp")
require("plugins.lualine")
require("plugins.orgmode")
require("plugins.sidebar")
require("plugins.telescope")
require("plugins.treesitter")
require("config")
require("keybindings")

vim.cmd [[source $HOME/.config/nvim/config.vim]]

-- TODO Move to lua
vim.cmd [[source $HOME/.config/nvim/plugins.vim]]

-- Filetype specific stuff
vim.cmd [[source $HOME/.config/nvim/ft.vim]]

-- Keyboard stuff
-- TODO move to lua
vim.cmd [[source $HOME/.config/nvim/keybindings.vim]]

-- Autostuff done automatically
vim.cmd [[source $HOME/.config/nvim/autocommands.vim]]
