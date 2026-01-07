-- luacheck: globals vim
vim.lsp.enable("luals")
vim.lsp.enable("gopls")
vim.lsp.enable("zls")
vim.lsp.enable("kotlinls")
vim.lsp.enable("java")

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local telescope = require("telescope.builtin")

		vim.lsp.inlay_hint.enable(true)

		vim.keymap.set("n", "gtr", telescope.lsp_references, { buffer = event.buf, desc = "LSP Reference" })
		vim.keymap.set(
			"n",
			"<C-l>s",
			telescope.lsp_document_symbols,
			{ buffer = event.buf, desc = "LSP Document Symbols" }
		)
		vim.keymap.set("n", "<C-l>g", vim.lsp.buf.declaration, { buffer = event.buf, desc = "go to declaration" })
		vim.keymap.set("n", "<C-l>d", telescope.lsp_definitions, { buffer = event.buf, desc = "LSP Definitions" })
		vim.keymap.set("n", "<C-l>r", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP Rename" })
		vim.keymap.set("n", "<C-l>a", vim.lsp.buf.code_action, { buffer = event.buf, desc = "LSP Code Action" })
	end,
})

vim.keymap.set({ "i", "s" }, "<C-i>", function()
	if vim.snippet.active({ direction = 1 }) then
		return "<Cmd>lua vim.snippet.jump(1)<CR>"
	else
		return "<Tab>"
	end
end, { expr = true })

vim.keymap.set({ "i", "s" }, "<C-o>", function()
	if vim.snippet.active({ direction = -1 }) then
		return "<Cmd>lua vim.snippet.jump(-1)<CR>"
	else
		return "<Tab>"
	end
end, { expr = true })

vim.keymap.set("n", "<space>m", function()
	vim.cmd("make")
end, {})

vim.keymap.set("n", "<space>j", function()
	require("qf").junit()
end, {})

vim.keymap.set("n", "<space>pr", function()
	require("scholar").load()
end, {})

require("neogit").setup({
	commit_popup = "vertical split",
	popup = {
		kind = "vsplit",
	},
	preview_buffer = {
		kind = "vsplit",
	},
	signs = {
		hunk = { "", "" },
		section = { "+", "-" },
		item = { "+", "-" },
	},
})

require("todo-comments").setup({
	search = {
		command = "todo-zen",
		args = {
			"--max-src-depth",
			"0",
		},
	},
})

require("blink.cmp").setup({
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
	signature = { enabled = true },
	completion = {
		keyword = { range = "prefix" },
		accept = { auto_brackets = { enabled = true } },
		documentation = { auto_show = true, auto_show_delay_ms = 300 },
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			},
		},
	},
	keymap = {
		preset = "none",

		["<C-n>"] = { "show", "select_next", "fallback" },
		["<C-p>"] = { "show", "select_prev", "fallback" },

		["<C-e>"] = { "cancel", "fallback" },
		["<C-k>"] = { "show_documentation", "hide_documentation" },
		["<C-y>"] = { "select_and_accept" },
		["<Cr>"] = { "accept", "fallback" },

		["<C-space>"] = { "cancel", "fallback" },
	},
})
