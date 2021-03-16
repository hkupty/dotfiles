--[[ Vimwiki ]]--
vim.g.vimwiki_list = {
  {
    path = "/opt/code/wiki/",
    index = "main",
    sytax = "markdown",
    --nested_syntaxes = {}
  }
}

--[[ Vimwiki ]]--

--[[ Treesitter ]]--
--- Folds:
vim.cmd[[set foldmethod=expr]]
vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
--[[ Treesitter ]]--
