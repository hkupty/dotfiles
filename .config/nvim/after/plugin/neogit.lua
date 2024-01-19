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
