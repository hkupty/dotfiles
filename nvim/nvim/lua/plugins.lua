-- luacheck: globals unpack vim
-- Plugins
--- Acid
local acid = require("acid")
local connections = require('acid.connections')
local eval = require("acid.ops").eval
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
local lsp = require("nvim_lsp")
local lsp_cfg = require("nvim_lsp/configs")

-- Zettel
local zettel = require("zettel")

-- Icons
require('nvim-web-devicons').setup()


filter_fzy.load(vim.fn.findfile("so/libfzy.so", vim.o.rtp))
impromptu.config.filter.filter_fn = filter_fzy.filter

hkupty.configure_impromptu = function()
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

hkupty.find_top_build = function(fname)
  return lsp.util.search_ancestors(fname, function(path)
    return lsp.util.path.exists(path .. "/BUILD") or lsp.util.path.exists(path .. "/WORKSPACE")
  end)
end

lsp_cfg.java_lsp = {
  default_config = {
    cmd = {"/opt/code/forks/java-language-server/dist/lang_server_linux.sh", "--file"},
    filetypes = {"java"},
    root_dir = function(fname)
      return hkupty.find_top_build(fname) or lsp.util.find_git_ancestor(fname)
    end,
    settings = {java = {bazelBinary = "bazelisk"}}
  }
}

--lsp.java_lsp.setup{}

nrepl.default_middlewares = {'nrepl/nrepl', 'cider/cider-nrepl', 'refactor-nrepl', 'iced-nrepl'}

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
    dashboard()
    require("cartographer.v2").files{}
  end,
  new_tab = function()
    dashboard()
    require("cartographer.v2").project{}
  end

}

nvimux.bindings.bind_all{
  {'f', function() require("cartographer.v2").functions{} end, {'n', 'v', 'i'}},
  {'g', function() require("cartographer.v2").branch_changed{} end, {'n', 'i'}},
  {'s', nvimux.commands.horizontal_split, {'n', 'v', 'i', 't'}},
  {'v', nvimux.commands.vertical_split, {'n', 'v', 'i', 't'}},
  {'**', function() nvimux.config.set{new_tab = term} end, {'n', 'v', 'i', 't'}},
  {'*-', function() nvimux.config.set{new_tab = ""} end, {'n', 'v', 'i', 't'}},
  {'$', trex.invoke, {'n', 'v', 'i', 't'}},
  {'i', hkupty.configure_impromptu, {'n'}}
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
  }
}

