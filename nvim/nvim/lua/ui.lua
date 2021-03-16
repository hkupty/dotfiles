local ui = {
  _cache = {}
}

ui.singleton_buf = function(config)
  local cached = ui._cache[config.name]
  if cached == nil or not vim.api.nvim_buf_is_loaded(cached) then
     cached = ui.new_buf(config)
    ui._cache[config.id or config.name] = cached
  end
  return cached
end

ui.new_buf = function(config)
  local buf = vim.api.nvim_create_buf(false, true)
  if config.name ~= nil then
    vim.api.nvim_buf_set_name(buf, config.name)
  end
  return buf
end

ui.global_size = function()
  local width = 0
  local height = 0

  for ui in vim.api.nvim_list_uis() do
    if width < ui.width then
      width = ui.width
    end
    if height < ui.height then
      height = ui.height
    end
  end

  return width, height
end

ui.current_size = function()
  local win = vim.api.nvim_get_current_win()
  local width = vim.api.nvim_win_get_width(win)
  local height = vim.api.nvim_win_get_height(win)

  return width, height
end

_G.ui = ui

return ui
