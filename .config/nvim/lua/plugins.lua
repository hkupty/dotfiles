-- luacheck: globals vim
-- Plugins
--- Acid
local nrepl = require('acid.nrepl')

-- Impromptu
local impromptu = require("impromptu")
-- Use FZY for fuzzy filtering
local filter_fzy = require("impromptu.internals.extra.fzy")
local default_filter = require("impromptu.internals.filter")

-- Iron
local iron = require("iron")
local trex = require("trex")

-- Nvimux
local nvimux = require('nvimux')


-- LSP
local lsp = require("lspconfig")

-- Zettel
local zettel = require("zettel")

-- Icons
require('nvim-web-devicons').setup()

filter_fzy.load(vim.fn.findfile("so/libfzy.so", vim.o.rtp))
impromptu.config.filter.filter_fn = filter_fzy.filter

_G.hkupty.configure_impromptu = function()
  impromptu.ask{
    title = "Configure impromptu",
    options = {
      default_filter = {
        type = "filter",
        description = "Set default filter",
        filter = default_filter.filter_fn
      },
      fuzzy_filter = {
        type = "filter",
        description = "Set fuzzy filter",
        filter = filter_fzy.filter
      }
    },
    handler = function(_, opt)
      if opt.type == "filter" then
        impromptu.config.filter.filter_fn = opt.filter
      end
      return true
    end
  }
end

zettel.config.dir = "$CODE/zettels"

_G.hkupty.find_top_build = function(fname)
  return lsp.util.root_pattern("WORKSPACE")(fname)
end

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local capabilities = vim.lsp.protocol.make_client_capabilities()
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
  on_attach = on_attach,
  autostart = true
}

vim.lsp.set_log_level("debug")

nrepl.default_middlewares = {
  'nrepl/nrepl',
  'cider/cider-nrepl',
  'refactor-nrepl/refactor-nrepl',
  'com.github.liquidz/iced-nrepl'
}

nvimux.config.set_all{
  open_term_by_default = true,
  new_window_buffer = 'single',
  quickterm_direction = 'botright',
  quickterm_orientation = 'vertical',
  quickterm_scope = 't',
  quickterm_size = '80',
  new_term = "call IronStartRepl('sh', 0, 1)",
  new_window = function()
    -- vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(false, true))
    _G.dashboard()
    require("cartographer.v2").files{}
  end,
  new_tab = function()
    _G.dashboard()
    require("cartographer.v2").project{}
  end

}

nvimux.bindings.bind_all{
  {'f', function() require("cartographer.v2").functions{} end, {'n', 'v', 'i'}},
  {'g', function() require("cartographer.v2").branch_changed{} end, {'n', 'i'}},
  {'s', nvimux.commands.horizontal_split, {'n', 'v', 'i', 't'}},
  {'v', nvimux.commands.vertical_split, {'n', 'v', 'i', 't'}},
  {'*-', function() nvimux.config.set{new_tab = ""} end, {'n', 'v', 'i', 't'}},
  {'$', trex.invoke, {'n', 'v', 'i', 't'}},
  {'i', _G.hkupty.configure_impromptu, {'n'}}
}

nvimux.bootstrap()

iron.core.add_repl_definitions{
  clojure = {
    lein_connect = {
      command = {"lein", "repl", ":connect"}
    }
  },
  lua = {
    nero = {
      command = {"nero"}
    }
  },
  viml = {
    nero = {
      command = {"nero"}
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "python",
    clojure = "lein"
  },
     repl_open_cmd = "botright 40 split"
}

require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = { ["q"] = function() require("sidebar-nvim").close() end },
    open = false,
    side = "left",
    initial_width = 35,
    update_interval = 1000,
    sections = { "datetime", "git-status", "todos", "lsp-diagnostics" },
    section_separator = "──────"
})
