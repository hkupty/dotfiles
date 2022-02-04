local lsp = require("lspconfig")

local on_attach = function(x, bufnr)

  -- Mappings.
  local opts = { noremap=true, silent=true, buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>e', vim.lsp.diagnostic.show_line_diagnostics, opts)
  vim.keymap.set('n', '[d', vim.lsp.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.lsp.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, opts)

end

_G.hkupty.find_top_build = function(fname)
  return lsp.util.root_pattern("WORKSPACE")(fname)
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

lsp.java_language_server.setup{
  cmd = {"java-language-server"},
  capabilities = capabilities,
  root_dir = function(fname)
    return _G.hkupty.find_top_build(fname) or lsp.util.find_git_ancestor(fname)
  end,
  on_attach = on_attach,
  autostart = true
}

lsp.kotlin_language_server.setup{
  capabilities = capabilities,
  root_dir = function(fname)
    return lsp.util.root_pattern("build.gradle")(fname) or lsp.util.find_git_ancestor(fname)
  end,
  on_attach = on_attach,
  autostart = true
}

vim.lsp.set_log_level("debug")
