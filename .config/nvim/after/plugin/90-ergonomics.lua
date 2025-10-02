-- luacheck: globals vim

--[ Keybindings ]--

-- TODO navigation
vim.keymap.set("n", "]t", require("todo-comments").jump_next, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", require("todo-comments").jump_prev, { desc = "Previous todo comment" })

-- Diagnostic navigation
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic error" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic error" })
vim.keymap.set("n", "gh", function()
	vim.diagnostic.open_float()
end, { desc = "Open current diagnostic error" })

-- Directory navigation
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
vim.keymap.set("n", "<C-s>s", function()
	local pwd = vim.fn.expand("%:h")
	vim.cmd("tcd " .. pwd)
end, {})

vim.keymap.set("n", "<C-s>u", function()
	local pwd = vim.fn.getcwd(0, 0)
	vim.cmd("tcd " .. pwd .. "/..")
end, {})

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("nohl")
end, {})

vim.keymap.set("n", "<leader>e", function()
	vim.cmd("tabe $MYVIMRC")
	vim.cmd("tcd $HOME/.config/nvim")
end, {})

-- Git
vim.keymap.set("n", "<C-n>", require("neogit").open)

-- Open term
vim.keymap.set("n", "g!", function()
	local bufnr = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_win_set_buf(0, bufnr)
	vim.fn.jobstart(vim.fn.expand("$SHELL"), {
		on_exit = function()
			local bufwinid = vim.fn.bufwinid(bufnr)
			local windows = vim.api.nvim_tabpage_list_wins(0)
			if #windows == 1 and windows[1] == bufwinid then
				vim.cmd("new")
				vim.api.nvim_win_close(bufwinid, true)
			end
		end,
		term = true,
	})
end)

-- Disable arrows
for _, key in pairs({ "Up", "Down", "Left", "Right" }) do
	vim.keymap.set("n", "<" .. key .. ">", "<NOP>", {})
	vim.keymap.set("n", "<S-" .. key .. ">", "<NOP>", {})
end

-- Visual
vim.keymap.set("v", "gna", ":'<,'>normal @a", {})
vim.keymap.set("v", "<C-c>", '"+y', {})

-- Insert
vim.keymap.set("i", "<C-v>", '<ESC>"+pa', {})
for _, key in pairs({ "h", "j", "k", "l" }) do
	vim.keymap.set("i", "<C-w>" .. key, "<ESC><C-w><C-" .. key .. ">", {})
end

-- Command
vim.keymap.set("c", "<C-a>", "<Home>", {})
vim.keymap.set("c", "<C-h>", "<S-Left>", {})
vim.keymap.set("c", "<M-b>", "<S-Left>", {})
vim.keymap.set("c", "<C-l>", "<S-Right>", {})
vim.keymap.set("c", "<M-f>", "<S-Right>", {})
vim.keymap.set("c", "<C-e>", "<End>", {})

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", {})
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", {})

-- terminal
vim.keymap.set("t", "<C-v>", [[<C-\><C-n>"+pa]], {})
