require("nvim-treesitter").install({
	"bash",
	"clojure",
	"dockerfile",
	"git_config",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"hocon",
	"go",
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
	"tsx",
	"vim",
	"yaml",
	"zig",
})

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

vim.keymap.set("n", "]c", function()
	require("treesitter-context").go_to_context(-vim.v.count1)
end, { silent = true })
