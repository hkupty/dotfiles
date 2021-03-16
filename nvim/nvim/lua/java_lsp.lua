local lsp = require('nvim_lsp')
local configs = require('nvim_lsp/skeleton')

if lsp.jdtls == nil then
  configs.jdtls = {
    default_config = {
      cmd = {"/usr/bin/jdtls"},
      filetypes = {"java"},
      root_dir = function(fname)
        return lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
      end,
      log_level = vim.lsp.protocol.MessageType.Warning,
      settings = {}
    }
  }
end

lsp.jdtls.setup{}
