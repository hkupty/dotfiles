-- luacheck: globals vim
-- Plugins
--- Acid

-- Impromptu
local impromptu = require("impromptu")
-- Use FZY for fuzzy filtering
local filter_fzy = require("impromptu.internals.extra.fzy")
local default_filter = require("impromptu.internals.filter")

-- Nvimux
local nvimux = require('nvimux')

-- Icons
require('nvim-web-devicons').setup()

local hkupty = {}

_G.tap = function(obj)
  print(vim.inspect(obj))
  return obj
end

hkupty.unload = function(key)
  local pattern = "^" .. key .. ".-$"
  for k, _ in pairs(package.loaded) do
    if k:match(pattern) ~= nil then
      package.loaded[k] = nil
    end
  end
end

local starts_with = function(str, begin)
  return str:sub(1, #begin) == begin
end


hkupty.reload = function(ns)
  for k, _ in pairs(package.loaded) do
    if starts_with(k, ns) then
      package.loaded[k] = nil
    end
  end
end

hkupty.openfile = function(fname)
  vim.cmd("edit " .. fname)
end

filter_fzy.load(vim.fn.findfile("so/libfzy.so", vim.o.rtp))
impromptu.config.filter.filter_fn = filter_fzy.filter

hkupty.configure_impromptu = function()
  impromptu.ask {
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

nvimux.setup {
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
    { { 'n', 'v', 'i', 't' }, 's', nvimux.commands.horizontal_split },
    { { 'n', 'v', 'i', 't' }, 'v', nvimux.commands.vertical_split },
    { { 'n', 'v', 'i', 't' }, '$', function()
      require("text").invoke()
    end },
    { { 'n' }, 'i', hkupty.configure_impromptu }
  }
}

vim.g.markdown_folding = 1
