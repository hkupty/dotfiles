require("git-worktree").setup { change_directory_command = "tcd" }

require("telescope").load_extension("git_worktree")

local neogit = require("neogit")

neogit.setup {
  commit_popup = "vertical split",
  popup = {
    kind = "vsplit"
  },
  preview_buffer = {
    kind = "vsplit"
  },
  signs = {
    section = { "+", "-" },
    item = { "+", "-" }
  }
}
