-- luacheck: globals vim

require("conform").setup({
	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		kotlin = { "ktlint", "--ruleset=/home/hkupty/.local/state/nvim/ktlint/ktlint-ruleset-standard-0.49.1.jar" },
		lua = { "stylua" },
		json = { "jq" },
		yaml = { "yq" },
		hcl = { "hcl" },
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

require("lint.linters.ktlint").args = { "--reporter=json", "--stdin" }

require("lint").linters_by_ft = {
	sh = { "shellcheck" },
	bash = { "shellcheck" },
	yaml = { "yamllint" },
	kotlin = { "ktlint" },
	lua = { "luacheck" },
	markdown = { "proselint", "vale" },
	NeogitCommitMessage = { "proselint", "vale" },
	pullrequest = { "proselint", "vale" },
}
