vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil_preview",
	callback = function(params)
		vim.keymap.set("n", "y", "o", { buffer = params.buf, remap = true, nowait = true })
	end,
})

vim.api.nvim_create_augroup("hkupty", {})

vim.api.nvim_create_autocmd("FocusLost", {
	group = "hkupty",
	desc = "Save everything on focus lost",
	pattern = "*",
	command = "silent! wa",
})

vim.api.nvim_create_autocmd("TermOpen", {
	group = "hkupty",
	desc = "Special terminal settings",
	pattern = "*",
	command = "setl nonumber norelativenumber scrolloff=0",
})
