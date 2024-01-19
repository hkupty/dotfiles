require('nightfox').setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled",
    transparent = false,
    terminal_colors = true,
    dim_inactive = true,
    styles = {
      comments = "italic",
      conditionals = "NONE",
      constants = "italic",
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {
      match_paren = false,
      visual = true,
      search = true,
    },
    modules = {
      telescope = true,
      cmp = true,
      gitsigns = true,
      modes = true,
      treesitter = true,
      neogit = true
    },
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")
