-- luacheck: globals vim
--Bordet
local bordet = require("bordet")
local ui = require("ui")

--- Produces a random hexadecimal string
-- @param sz: Integer size in multiple of four (default 8)
-- @return String hexadecimal string
local randomhex = function(sz)
  local gen = {
      [[hexdump -n ]] .. (sz or 8) .. [[ -e '4/4 "%01X" 0 ""' /dev/urandom]]
  }

  local random = vim.api.nvim_call_function("system", {
      table.concat(gen, " | ")
    })

  return vim.trim(random)
end

local random = function(sz)
  local gen = {
    [[head -c 200 /dev/urandom]],
    [[sha256sum]],
    [[awk '{print toupper($1)}']],
    [[xargs -I{} echo "obase=10; ibase=16; {}"]],
    [[bc]] ,
    [[tr '\n' ' ']],
    [[sed 's/\\* //g']],
  }

  local random = vim.api.nvim_call_function("system", {
      table.concat(gen, " | ")
    })

  return tonumber(random:sub(1, sz))
end

local hkupty = {}
_G.hkupty = hkupty

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

hkupty.reluafile = function(obj)
  local ns = {}
  for i in string.gmatch(obj, "([^/]+)") do
    if i ~= "lua" and i ~= "init" then
      table.insert(ns, i)
    end
  end

  local nsstr = table.concat(ns, ".")
  hkupty.reload(nsstr)
  return nsstr
end

hkupty.openfile = function(fname)
  vim.cmd("edit " .. fname)
end


_G.dashboard = function()
  local buf = ui.singleton_buf{name = "[bordet]"}
  vim.api.nvim_win_set_buf(0, buf)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, bordet.get_dashboard())
end


_G.random = random
_G.randomhex = randomhex
