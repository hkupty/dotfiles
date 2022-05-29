local iron = require("iron.core")

iron.setup {
  config = {
    should_map_plug = false,
    scratch_repl = true,
    highlight_last = false,
    repl_open_cmd = "botright 30 split",
    repl_definition = {
      weirdFt = {
        command = {"zsh"}
      },
      sh = {
        command = {"zsh"}
      },
      python = require("iron.fts.python").ipython,
      octave = {
        command = {"octave"}
      }

    }
  },
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_line = "<space>sl",
    repeat_cmd = "<space>s.",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  }
}
