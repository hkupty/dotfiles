-- luacheck: globals vim

local gitsigns = require("gitsigns")

local nav_options = {
	async = false,
	target = "all",
}

gitsigns.setup({
	signs = {
		add = { text = "┋" },
		change = { text = "┋" },
		delete = { text = "╍" },
		topdelete = { text = "┌" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "━" },
		topdelete = { text = "┏" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	current_line_blame = true,
	on_attach = function(bufnr)
		vim.keymap.set("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next", nav_options)
			end
		end, { buffer = bufnr })
		vim.keymap.set("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev", nav_options)
			end
		end, { buffer = bufnr })

		-- Actions
		vim.keymap.set({ "n", "v" }, "<space>hs", gitsigns.stage_hunk, { buffer = bufnr })
		vim.keymap.set({ "n", "v" }, "<space>hr", gitsigns.reset_hunk, { buffer = bufnr })
		vim.keymap.set("n", "<space>hS", gitsigns.stage_buffer, { buffer = bufnr })
		vim.keymap.set("n", "<space>hR", gitsigns.reset_buffer, { buffer = bufnr })
		vim.keymap.set("n", "<space>hp", gitsigns.preview_hunk, { buffer = bufnr })
		vim.keymap.set("n", "<space>hq", gitsigns.setqflist, { buffer = bufnr })
		vim.keymap.set("n", "<space>hQ", function()
			gitsigns.setqflist("all")
		end, { buffer = bufnr })
		vim.keymap.set("n", "<space>hip", gitsigns.preview_hunk_inline, { buffer = bufnr })
		vim.keymap.set("n", "<space>hb", function()
			gitsigns.blame_line({ full = true })
		end, { buffer = bufnr })
		vim.keymap.set("n", "<space>hib", gitsigns.toggle_current_line_blame, { buffer = bufnr })
		vim.keymap.set("n", "<space>hd", gitsigns.diffthis, { buffer = bufnr })
		vim.keymap.set("n", "<space>hD", function()
			gitsigns.diffthis("~")
		end, { buffer = bufnr })

		-- Text object
		vim.keymap.set({ "o", "x" }, "ih", gitsigns.select_hunk)
	end,
})
