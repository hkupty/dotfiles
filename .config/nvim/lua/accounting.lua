local bufnr = 12
local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, true)
local sum = 0
local category = lines[1]
if category ~= "" then
  for _, v in ipairs(lines) do
      if v ~= "" then
        local value_col = vim.split(v, "\t")[7]
        if value_col ~= nil then
          local str = string.gsub(value_col, " ", ""):gsub(",",".")
          sum = sum + tonumber(str)
        end
      end
  end
end
sum = math.abs(sum)


local totalbufnr = 11
local ttlines = vim.api.nvim_buf_get_lines(totalbufnr, 0, -1, true)
if category ~= "" then
  local add = false
  if vim.startswith(category, "+") then
    category = string.gsub(category, "+", "")
    add = true
  end
  local linenr = nil
  for i, line in ipairs(ttlines) do
    if vim.startswith(line, "->") then
      linenr = nil
    elseif vim.startswith(line, "    " .. category) then
      linenr = i
    end
  end
  if linenr == nil then
    table.insert(ttlines, "")
    linenr = #ttlines
  end
  if add then
    sum = (vim.split(vim.trim(ttlines[linenr]), " ")[2] or 0) + sum
  end
  ttlines[linenr] = "    " .. category .. " " .. tostring(sum)
end

local block = nil
for i, v in ipairs(ttlines) do
  if vim.startswith(v, "->") then
    if block ~= nil then
      ttlines[block] = table.concat({"->", vim.split(ttlines[block], " ")[2], tostring(sum)}, " ")
    end
    sum = 0
    block = i
  elseif v ~= "" then
    local line = vim.trim(v)
    print(vim.inspect{i, line})
    sum = sum + tonumber(vim.split(line, " ")[2])
  end
end

ttlines[block] = table.concat({"->", vim.split(ttlines[block], " ")[2], tostring(sum)}, " ")

vim.api.nvim_buf_set_lines(totalbufnr, 0, -1, true, ttlines)
