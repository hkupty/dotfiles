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
local trex = require("trex")

-- Nvimux
local nvimux = require('nvimux')

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

nrepl.default_middlewares = {
  'nrepl/nrepl',
  'cider/cider-nrepl',
  'refactor-nrepl/refactor-nrepl',
  'com.github.liquidz/iced-nrepl'
}

nvimux.setup{
  config = {
    prefix = "<C-H>",
    open_term_by_default = true,
    new_window_buffer = 'single',
    quickterm = {
      direction = 'botright',
      orientation = 'vertical',
      scope = 't',
      size = '80',
      command = function() require("iron.core").repl_here("sh") end,
    },
    new_window = function()
      vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(false, true))
      -- _G.dashboard()
    end,
    new_tab = function()
      -- _G.dashboard()
    end
  },
  bindings = {
    {{'n', 'v', 'i', 't'}, 's', nvimux.commands.horizontal_split},
    {{'n', 'v', 'i', 't'}, 'v', nvimux.commands.vertical_split},
    {{'n', 'v', 'i', 't'}, '$', trex.invoke},
    {{'n'}, 'i', _G.hkupty.configure_impromptu}
  }
}

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
