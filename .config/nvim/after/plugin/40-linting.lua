-- luacheck: globals vim

require("conform").setup({
	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		lua = { "stylua" },
		json = { "jq" },
		yaml = { "yq" },
    proto = { "buf" },
	},
	format_after_save = function(_bufnr)
		vim.notify("Formatting...", vim.log.levels.INFO, {})
		return {
			lsp_format = "fallback",
		}, function()
			vim.notify("Linting...")
			require("lint").try_lint()
			vim.notify("Formatted and linted")
		end
	end,
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

require("lint").linters_by_ft = {
	sh = { "shellcheck" },
	bash = { "shellcheck" },
	yaml = { "yamllint" },
	lua = { "luacheck" },
  proto = { "protolint" },
	markdown = { "vale" },
	NeogitCommitMessage = { "vale" },
	pullrequest = { "vale" },
}
