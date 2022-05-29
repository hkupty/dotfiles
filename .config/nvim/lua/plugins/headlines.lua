require('headlines').setup{
  markdown = {
    headline_highlights = { "Headline", "Subline", "Detail" },
  },
  org = {
    headline_highlights = { "Headline", "Subline", "Detail" },
  },
  yaml = {
    dash_pattern = "^---+$",
    dash_highlight = "Dash",
  }
}
