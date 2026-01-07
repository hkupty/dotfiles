require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"clojure",
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
		"tsx",
		"vim",
		"yaml",
		"zig",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
})

vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

vim.keymap.set("n", "]c", function()
	require("treesitter-context").go_to_context(-vim.v.count1)
end, { silent = true })
