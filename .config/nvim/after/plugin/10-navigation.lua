-- luacheck: globals vim
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local telescope = require("telescope.builtin")
local todo = require("telescope._extensions.todo-comments").exports.todo
local nvimux = require("nvimux")

local project_folders = function(opts)
	opts = opts or {}
	local find_command = {
		"coords",
	}

	pickers
		.new(opts, {
			prompt_title = "Select project folder",
			finder = finders.new_oneshot_job(find_command, opts),
			previewer = conf.file_previewer(opts),
			sorter = conf.file_sorter(opts),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.api.nvim_command("tcd " .. selection[1])
				end)
				return true
			end,
		})
		:find()
end

require("telescope").load_extension("fzy_native")

-- Files
vim.keymap.set("n", "<C-b>", telescope.buffers, { desc = "buffers" })
vim.keymap.set("n", "<C-p>", telescope.find_files, { desc = "find files" })
vim.keymap.set("n", "<C-M-f>", telescope.live_grep, { desc = "live grep" })
vim.keymap.set("n", "<C-space>", telescope.resume, { desc = "resume" })
vim.keymap.set("n", "<C-M-p>", project_folders, {})

-- Fixing
vim.keymap.set("n", "<C-q>f", telescope.quickfix, {})
vim.keymap.set("n", "<C-q>d", telescope.diagnostics, { desc = "diagnostics" })
vim.keymap.set("n", "<C-q>t", todo, { desc = "TODO Navigation" })

-- Git-related
vim.keymap.set("n", "<C-g>f", telescope.git_status, {})
vim.keymap.set("n", "<C-g>b", telescope.git_branches, {})
vim.keymap.set("n", "<C-g>c", telescope.git_commits, {})
vim.keymap.set("n", "<C-g>C", telescope.git_bcommits, {})
vim.keymap.set("n", "<C-g>s", telescope.git_stash, {})

-- Tree-sitter
vim.keymap.set("n", "<C-s>t", telescope.treesitter, {})

require("telescope").setup({
	defaults = {
		layout_strategy = "bottom_pane",
		layout_config = {
			height = 0.4,
		},
		mappings = {
			i = {
				["<c-space>"] = function(prompt_bufnr)
					require("telescope.actions.generate").refine(prompt_bufnr, {})
				end,
			},
		},
		border = true,
		sorting_strategy = "ascending",
	},
})

nvimux.setup({
	config = {
		prefix = "<C-H>",
		open_term_by_default = true,
		new_window_buffer = "single",
		quickterm = {
			direction = "botright",
			orientation = "vertical",
			scope = "t",
			size = "80",
		},
		new_window = function()
			vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(false, true))
		end,
		new_tab = function() end,
	},
	bindings = {
		{ { "n", "v", "i", "t" }, "s", nvimux.commands.horizontal_split },
		{ { "n", "v", "i", "t" }, "v", nvimux.commands.vertical_split },
	},
})
