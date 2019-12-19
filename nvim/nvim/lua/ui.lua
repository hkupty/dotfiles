local ui = {}

ui.singleton_buf = function()
  if ui._buf == nil or not vim.api.nvim_buf_is_loaded(ui._buf) then
    ui._buf = ui.new_buf()
  end
  return ui._buf
end

ui.new_buf = function()
  return vim.api.nvim_create_buf(false, true)
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

ui.on_new = function(new_cmd, fn)
  vim.api.nvim_command(new_cmd)
  fn()
end

ui.new_win = function()
  ui.on_new_win(function()
    vim.api.nvim_set_current_buf(ui.singleton_buf())
  end)
end

_G.ui = ui

return ui
