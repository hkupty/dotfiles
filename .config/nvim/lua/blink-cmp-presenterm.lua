---@module 'blink.cmp'

local M = {}

function M.new()
  ---@type blink-cmp-presenterm.Source
  return setmetatable({}, { __index = M })
end

function M:enabled()
  return vim.fn.executable("presenterm")
end

---@param len integer
---@return integer
local function len_to_loglen(len)
  return math.ceil(math.log10(len + 1))
end

---@param input string
---@param number integer
---@param loglen integer
---@return string
local function number_to_text(input, number, loglen)
  return string.format(input .. '%0' .. loglen .. 'd', number)
end

function M:candidates(input, max_entries)
  local cmd = vim.fn.executable("presenterm")
  if cmd == 0 then
    return {}
  end

  local handle = io.popen("presenterm --list-comment-commands 2>/dev/null")
  if not handle then
    return {}
  end

  local output = handle:read("*a")
  handle:close()

  local candidates = {}
  local input_lower = input:lower()

  for line in output:gmatch("[^\r\n]+") do
    local full_cmd = line:match("^%s*(.-)%s*$")
    if full_cmd:sub(1, 5) == "<!-- " and full_cmd:sub(-4) == " -->" then
      local content = full_cmd:sub(6, -5)
      local cmd_name = content:match("^([^:]+)")
      local argument = content:match("^[^:]+:%s*(.+)$")

      if cmd_name then
        cmd_name = cmd_name:lower()
        if input == "" or cmd_name:find(input_lower, 1, true) then
          local label = "<!-- " .. content .. " -->"
          local insert_text = label

          table.insert(candidates, {
            label = label,
            insertText = insert_text,
            documentation = argument and ("Argument: " .. argument) or "No argument",
          })
        end
      end
    end

    if max_entries and #candidates >= max_entries then
      break
    end
  end

  return candidates
end

function M:get_completions(context, callback)
  vim.schedule(function()
    local input = string.sub(
      context.line,
      context.bounds.start_col,
      context.bounds.start_col + context.bounds.length - 1
    )
      callback {
        items = self:candidates(input, self.max_entries),
        is_incomplete_forward = true,
        is_incomplete_backward = true,
      }
  end)
end

return M
