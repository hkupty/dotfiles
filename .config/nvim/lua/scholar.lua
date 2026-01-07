-- luacheck: globals vim

-- TODO: Notes & github review comments
-- FIX: Sometimes the window reference is lost and I can't navigate to files
-- FIX: Should jump to a file from anywhere in the diff, not only from file name

local scholar = {}

scholar.init = function()
	scholar.commits = {}
	scholar.current = 1
	scholar.window = nil
	scholar.prevwindow = nil
	scholar.showbuf = 0
end

scholar.load = function()
	scholar.init()
	local function on_event(_, data, _)
		vim.list_extend(
			scholar.commits,
			vim.tbl_filter(function(x)
				return x ~= ""
			end, data)
		)
	end

	local function on_exit()
		scholar.current = vim.tbl_count(scholar.commits)
		scholar.show()
	end
	vim.fn.jobstart({ "git", "rev-list", "--no-merges", "origin/master..HEAD" }, {
		on_stdout = on_event,
		on_exit = on_exit,
		stdout_buffered = true,
	})
end

scholar.prev = function()
	if scholar.current < vim.tbl_count(scholar.commits) then
		scholar.current = scholar.current + 1
	end
	scholar.show()
end

scholar.next = function()
	if scholar.current > 1 then
		scholar.current = scholar.current - 1
	end
	scholar.show()
end

scholar.close = function()
	-- Only close if there's more than one window
	if #vim.api.nvim_list_wins() > 1 then
		if scholar.window and vim.api.nvim_win_is_valid(scholar.window) then
			vim.api.nvim_win_close(scholar.window, false)
		end
	end

	-- Delete buffers if they exist
	if scholar.buf and vim.api.nvim_buf_is_valid(scholar.buf) then
		vim.api.nvim_buf_delete(scholar.buf, {})
	end

	if scholar.showbuf and vim.api.nvim_buf_is_valid(scholar.showbuf) then
		vim.api.nvim_buf_delete(scholar.showbuf, {})
	end
	scholar.init()
end

scholar.show = function()
	if scholar.window == nil then
		scholar.buf = vim.api.nvim_create_buf(false, true)
		scholar.prevwindow = vim.fn.win_getid()
		scholar.window = vim.api.nvim_open_win(scholar.buf, true, {
			split = "right",
			win = 0,
		})
		vim.bo[scholar.buf].ft = "diff"

		vim.keymap.set("n", "q", scholar.close, { buffer = scholar.buf })
		vim.keymap.set("n", "<M-l>", scholar.next, { buffer = scholar.buf })
		vim.keymap.set("n", "<M-h>", scholar.prev, { buffer = scholar.buf })
		vim.keymap.set("n", "<CR>", scholar.file, { buffer = scholar.buf })
		vim.keymap.set("n", "]]", scholar.move_cursor_to_next, { buffer = scholar.buf })
		vim.keymap.set("n", "[[", scholar.move_cursor_to_prev, { buffer = scholar.buf })
	end

	if vim.b[scholar.buf].id ~= scholar.current then
		vim.api.nvim_buf_set_lines(scholar.buf, 0, -1, false, {})
		local function on_enter(_, data, _)
			vim.api.nvim_buf_set_lines(scholar.buf, -1, -1, false, data)
		end
		vim.fn.jobstart({ "git", "show", scholar.commits[scholar.current] }, {
			on_stdout = on_enter,
			stdout_buffered = true,
		})
		vim.b[scholar.buf].id = scholar.current
		local target = "scholar://" .. scholar.commits[scholar.current]
		vim.api.nvim_buf_set_name(scholar.buf, target)
	end
end

local function parse_hunk_header(line)
	-- Typical form: @@ -23,7 +23,8 @@
	local old_start, old_len, new_start, new_len = line:match("^@@%s*%-(%d+),?(%d*)%s*%+(%d+),?(%d*)%s*@@")

	if old_start then
		return {
			old_start = tonumber(old_start),
			old_len = tonumber(old_len ~= "" and old_len or 1),
			new_start = tonumber(new_start),
			new_len = tonumber(new_len ~= "" and new_len or 1),
		}
	end
end

scholar.locate = function(direction, enter)
	local pos = vim.api.nvim_win_get_cursor(scholar.window)
	local lines
	local iter_start, iter_end, step
	local linepos
	if direction == "up" then
		local offset
		if enter then
			offset = 0
		else
			offset = -1
		end
		lines = vim.api.nvim_buf_get_lines(scholar.buf, 0, pos[1] + offset, false)
		iter_start = #lines
		iter_end = 1
		step = -1
		linepos = 0
	else
		lines = vim.api.nvim_buf_get_lines(scholar.buf, pos[1], -1, false)
		iter_start = 1
		iter_end = #lines
		step = 1
		linepos = pos[1]
	end
	local filename, cursor, matchpos
	for i = iter_start, iter_end, step do
		local line = lines[i]
		local match = line:match("^%+%+%+ b/(.+)")
		if match then
			filename = match
			matchpos = linepos + i
		end
		local hunk = parse_hunk_header(line)
		if (direction == "down" and hunk) or (direction == "up" and not cursor) then
			cursor = hunk
		end

		if filename and cursor then
			return { matchpos, filename, cursor }
		end
	end

	if filename then
		return { matchpos, filename }
	end
end

scholar.close_file = function()
	local prev_buffer = vim.w[scholar.prevwindow].previous
	if vim.api.nvim_buf_is_valid(prev_buffer) then
		vim.api.nvim_win_set_buf(scholar.prevwindow, prev_buffer)
		vim.api.nvim_win_del_var(scholar.prevwindow, "previous")
	else
		vim.api.nvim_win_close(scholar.prevwindow, false)
	end
	vim.api.nvim_buf_delete(scholar.showbuf, {})
	scholar.showbuf = 0
end

scholar.file = function()
	local ret = scholar.locate("up", true)
	local filepath = ret[2]
	if filepath then
		vim.w[scholar.prevwindow].previous = vim.api.nvim_win_get_buf(scholar.prevwindow)
		vim.api.nvim_set_current_win(scholar.prevwindow)

		local function update_pos()
			if ret[3] then
				vim.api.nvim_win_set_cursor(scholar.prevwindow, { ret[3].new_start, ret[3].new_len })
			end
		end

		local target = "scholar://" .. scholar.commits[scholar.current] .. "/" .. filepath

		if vim.api.nvim_buf_get_name(scholar.showbuf) ~= target then
			vim.api.nvim_buf_delete(scholar.showbuf, {})
			scholar.showbuf = vim.api.nvim_create_buf(false, true)
			vim.keymap.set("n", "q", scholar.close_file, { buffer = scholar.showbuf })
			-- TODO: figure out window dynamically (if closed, open a new one)
			vim.api.nvim_win_set_buf(scholar.prevwindow, scholar.showbuf)

			local function on_enter(_, data, _)
				vim.api.nvim_buf_set_lines(scholar.showbuf, 0, -1, false, data)
			end
			vim.fn.jobstart({ "git", "show", scholar.commits[scholar.current] .. ":" .. filepath }, {
				on_stdout = on_enter,
				on_exit = update_pos,
				stdout_buffered = true,
			})

			vim.b[scholar.showbuf].file = filepath
			vim.api.nvim_buf_set_name(scholar.showbuf, target)
			local ft = vim.filetype.match({ filename = filepath })
			if ft then
				vim.bo[scholar.showbuf].filetype = ft
			end
		else
			update_pos()
		end
	else
		vim.notify("No file found in diff before cursor", vim.log.levels.WARN)
	end
end

scholar.move_cursor_to_next = function()
	local ret = scholar.locate("down")
	if ret ~= nil then
		vim.api.nvim_win_set_cursor(scholar.window, { ret[1], 0 })
	end
end

scholar.move_cursor_to_prev = function()
	local ret = scholar.locate("up")
	if ret ~= nil then
		vim.api.nvim_win_set_cursor(scholar.window, { ret[1], 0 })
	end
end

return scholar
