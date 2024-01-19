local neogen = require('neogen')

neogen.setup{
  enabled = true,
  languages = {
    lua = {
      template = {
        annotation_convention = "ldoc"
      }
    },
    kotlin = {
      template = {
        annotation_convention = "kdoc"
      }

    }
  }
}

vim.keymap.set({'n'}, '<Space>nf', neogen.generate, {silent = true})
