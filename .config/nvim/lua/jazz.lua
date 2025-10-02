-- luacheck: globals unpack vim
local acid = require('acid')
local ops = require('acid.commands').ops
local features = require('acid.features')
local nrepl = require('acid.nrepl')
local connections = require('acid.connections')
local impromptu = require("impromptu")

local jazz = {}

local low_level = {}

low_level.ends_with = function(str, ending)
  return ending == "" or str:sub(-#ending) == ending
end


jazz.nrepl_menu = function(pwd)
  pwd = pwd or vim.api.nvim_call_function("getcwd", {})

  local current = connections.current[pwd]
  local opts = {}

  local check
  if current ~= nil then
    current = connections.store[current]
    check = function (v)
      return v[2] == current[2] and v[1] == current[1]
    end
  else
    check = function(_) return false end
  end

  for ix, v in ipairs(connections.store) do
    local str = "nrepl://" .. v[1] .. ":" .. v[2]
    if check(v) then
      str = str .. " (current)"
    end

    opts[ix] = {
      description = str
    }
  end

  opts.new = {
    description = "Spawn new nrepl"
  }

  impromptu.ask{
    question = "Select nrepl to connect to:",
    options = opts,
    handler = function(_, selected)
      if selected.index == "new" then
        nrepl.start{pwd = pwd}
      else
        connections:select(pwd, selected)
      end

      return true
    end
  }
end

jazz.find_usages = function(symbol, ns)
  symbol = symbol or vim.api.nvim_call_function("expand", {"<cword>"})
  ns = ns or vim.api.nvim_call_function("AcidGetNs", {})
  local cb = vim.api.nvim_get_current_buf()
  local winnr = vim.api.nvim_call_function("bufwinnr", {cb})
  local pwd = vim.api.nvim_call_function('getcwd', {})
  local fname = vim.api.nvim_call_function('expand', {"%:p"})


  local ui = impromptu.filter{
    title = "🎵 Finding usages of [" .. ns .. "/" .. symbol .. "]",
    options = {},
    handler = function(_, obj)
      local data = obj.data.occurrence

      local fpath = data.file
      local col = math.floor(data['col-beg'] or 1)
      local ln = math.floor(data['line-beg'] or 1)

      local cur_scroll = vim.api.nvim_get_option("scrolloff")
      vim.api.nvim_set_option("scrolloff", 999)

      if low_level.ends_with(vim.api.nvim_call_function("expand", {"%"}), fpath) then
        vim.api.nvim_call_function("cursor", {ln, col})
      else
        vim.api.nvim_command(winnr .. "wincmd w | new +" .. ln .. " " .. fpath)
      end
      vim.api.nvim_set_option("scrolloff", cur_scroll)

      return true
    end
  }

  local acid_handler = function(data)
    if data.occurrence ~= nil then
      local descr = (
          data.occurrence.match .. " @ " .. data.occurrence.file .. ":" .. math.floor(data.occurrence['line-beg'])
        ):gsub("\n", "\\n")

      ui:update{description = descr, data = data}
    end
  end

  acid.run(features.list_usage(acid_handler, symbol, ns, pwd, fname))
end

jazz.require_all = function()
  acid.run(ops['ns-load-all']{})
end


_G.jazz = jazz

vim.api.nvim_command("command! -nargs=0 JazzNrepl lua jazz.nrepl_menu()")
vim.api.nvim_command("command! -nargs=0 RequireAll lua jazz.require_all()")
vim.api.nvim_command("command! -nargs=? JazzFindUsages lua jazz.find_usages(<f-args>)")
