local qf = {}

qf.junit = function()
	if qf.id == nil then
		vim.fn.setqflist({}, " ", { title = "junit" })
		qf.id = vim.fn.getqflist({ title = "junit", id = 0 }).id
	end

	vim.fn.setqflist({}, "r", { id = qf.id, lines = {} })
	local function on_event(_, data, event)
		if event == "stdout" then
			if data and vim.tbl_count(data) > 0 then
				vim.fn.setqflist({}, "a", { id = qf.id, lines = data })
			end
		end
	end
	vim.fn.jobstart({ "nj", "build/test-junit-xml" }, {
		on_stdout = on_event,
		stdout_buffered = true,
	})
end

return qf
