require("tsf").setup()
local targets = {
  "authzed",
	"bash",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"go",
	"gowork",
	"gomod",
	"gosum",
	"java",
	"jq",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"proto",
	"regex",
	"toml",
	"yaml",
  "vim",
  "vimdoc",
	"zig",
}

vim.api.nvim_create_autocmd("FileType", {
	pattern = targets,
	callback = function(ev)
		vim.treesitter.start(ev.buf)
	end,
})

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"
