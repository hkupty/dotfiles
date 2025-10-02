-- luacheck: globals vim
vim.lsp.enable("luals")
vim.lsp.enable("gopls")
vim.lsp.enable("zls")
vim.lsp.enable("kotlinls")

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
