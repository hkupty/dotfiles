-- luacheck: globals vim

local zen_mode = require("zen-mode")
local twilight = require("twilight")

zen_mode.setup {
  window = {
    width = 0.9,
    backdrop = 1,
  }
}


twilight.setup {}

vim.keymap.set("n", "zn", zen_mode.toggle, { desc = "Open zen mode" })
vim.keymap.set("n", "<leader>o", twilight.toggle, { desc = "Open zen mode" })
