local ts = require("nvim-treesitter")
local targets = {
	"bash",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"hocon",
	"go",
	"gowork",
	"gomod",
	"gosum",
	"groovy",
	"html",
	"java",
	"javascript",
	"jq",
	"json",
	"kotlin",
	"lua",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"toml",
	"vim",
	"yaml",
	"zig",
}

ts.install(targets)

vim.api.nvim_create_autocmd("FileType", {
	pattern = targets,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})

vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo[0][0].foldmethod = "expr"

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

vim.keymap.set("n", "]c", function()
	require("treesitter-context").go_to_context(-vim.v.count1)
end, { silent = true })
