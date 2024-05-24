-- luacheck: globals vim
local iron = require("iron.core")
local view = require("iron.view")

local function patch(fn)
  return function(opts)
    return function(...) return vim.tbl_extend("force", fn(...), opts) end
  end
end

iron.setup {
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_open_cmd = view.split.vertical.botright(0.61903398875),
    -- repl_open_cmd = patch(view.offset{
    --   width = "50%",
    --   height = 30,
    --   w_offset = view.helpers.flip(3),
    --   h_offset = view.helpers.flip(3)
    -- }){
    --     border = "single"
    --   },
    -- views = {
    --   default = view.offset{
    --     width = "50%",
    --     height = 30,
    --     w_offset = view.helpers.flip(3),
    --     h_offset = view.helpers.flip(3)
    --   },
    --   minimized = view.offset{
    --     width = "30%",
    --     height = 1,
    --     w_offset = view.helpers.flip(3),
    --     h_offset = view.helpers.flip(3)
    --   },
    --   -- vertical
    --   view.right("20%"),
    --   -- horizontal
    --   view.bottom("20%"),
    -- },
    repl_definition = {
      sh = {
        command = { "zsh" }
      },
      python = require("iron.fts.python").ipython,
    }
  },
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_mark = "<space>sm",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
  },
  highlight = {
    italic = true,
    bold = true
  }
}
