-- luacheck: globals vim
--[[ Vimwiki ]]--
vim.g.vimwiki_list = {
  {
    path = "/opt/code/wiki/",
    index = "main",
    sytax = "markdown",
    ext = "md",
    auto_diary_index = 1,
    auto_toc = 1,
    auto_generte_links = 1
  }
}

vim.g.vimwiki_ext2syntax = {
  ['.md'] = 'markdown',
  ['.markdown'] = 'markdown',
  ['.mdown'] = 'markdown',
}

vim.g.vimwiki_markdown_link_ext = 1
vim.g.taskwiki_markup_syntax = 'markdown'
vim.g.markdown_folding = 1

--[[ Vimwiki ]]--
--[[ Treesitter ]]--
--- Folds:
vim.cmd[[set foldmethod=expr]]
vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
--[[ Treesitter ]]--
