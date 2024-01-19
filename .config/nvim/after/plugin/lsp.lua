-- luacheck: globals vim
local lsp = require('lsp-zero').preset {
  manage_nvim_cmp = false
}

vim.lsp.set_log_level("INFO")
lsp.on_attach(function(_client, bufnr)
  local telescope = require('telescope.builtin')
  lsp.default_keymaps({ buffer = bufnr, omit = { 'F2', 'F3', 'F4' } })

  vim.keymap.set('n', 'gr', telescope.lsp_references, { buffer = true, desc = "LSP Reference" })
  vim.keymap.set('n', '<C-g>s', telescope.lsp_document_symbols,
    { buffer = true, desc = "LSP Document Symbols" })
  vim.keymap.set('n', '<C-g>d', telescope.lsp_definitions,
    { buffer = true, desc = "LSP Definitions" })
  vim.keymap.set('n', '<C-g>r', vim.lsp.buf.rename, { buffer = true, desc = "LSP Rename" })
  vim.keymap.set('n', '<C-g>a', vim.lsp.buf.code_action, { buffer = true, desc = "LSP Code Action" })
end)

lsp.ensure_installed {
  'kotlin_language_server',
  'java_language_server',
  'lua_ls',
  -- 'eslint',
  'rust_analyzer',
}

-- local util = require("lspconfig.util")
require('lspconfig').kotlin_language_server.setup {

  -- cmd = { '/opt/code/forks/kotlin-language-server/server/build/install/server/bin/kotlin-language-server' },
  cmd = { '/opt/code/hkupty/kettlebell/build/install/kettlebell/bin/kettlebell' },
  init_options = {
    storagePath = "$HOME/.cache/lspcache/"
  }
  -- root_dir = util.root_pattern("build.gradle", "build.gradle.kts")
}


lsp.set_sign_icons {
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
}

lsp.format_on_save {
  format_opts = {
    async = false,
    timeout_ms = 10000
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
  }
}

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

vim.lsp.set_log_level("info")

lsp.setup()
