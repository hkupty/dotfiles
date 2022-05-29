-- luacheck: globals vim

-- setup must be called before loading
vim.cmd[[colorscheme nordfox]]

--- Folds:
vim.cmd[[set foldmethod=expr]]
vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
