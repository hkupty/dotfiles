local pstr = require("plenary.strings")
local icons = require("nvim-web-devicons")

-- Helpers

local function format_block(text, hl, padding)
	if padding == nil then
		padding = 7
	end
	return string.format("%%#%s# %s", hl, pstr.align_str(text, padding, true))
end

local function fallbacktable(default, base)
	return setmetatable(base, {
		__index = function(tbl, k)
			local child = string.sub(k, 1, -2)
			local modeline = rawget(tbl, child)
			while modeline == nil and child ~= "" do
				child = string.sub(child, 1, -2)
				modeline = rawget(tbl, child)
			end

			if modeline ~= nil then
				return modeline
			end

			return format_block(k, default)
		end,
	})
end

local function cycling_cache()
	return setmetatable({}, {
		__newindex = function(tbl, key, val)
			if tbl._lru == nil then
				rawset(tbl, "_lru", {})
			end

			if tbl[key] ~= nil then
				rawset(tbl, key, val)
				return
			end

			while vim.tbl_count(tbl) > 10 do
				local rm_key = table.remove(tbl._lru, 1)
				rawset(tbl, rm_key, nil)
			end

			table.insert(tbl._lru, key)
			rawset(tbl, key, val)
		end,
	})
end

-- Caches and local variables

local git_cache = cycling_cache()

-- Primary & Secondary highlights

local mode_strings = fallbacktable("SLUnknownMode", {
	i = format_block("INSERT", "SLInsertMode"),
	n = format_block("NORMAL", "SLNormalMode"),
	nt = format_block("N-TERM", "SLTerminalMode"),
	t = format_block("TERMINAL", "SLTerminalMode"),
	v = format_block("VISUAL", "SLVisualMode"),
	V = format_block("V-LINE", "SLVisualMode"),
	["\22"] = format_block("V-BLOCK", "SLVisualMode"),
	R = format_block("REPLACE", "SLReplaceMode"),
	c = format_block("COMMAND", "SLCommandMode"),
})

local secondary_highlights = fallbacktable("SLOrange", {
	i = "SLBlue",
	n = "SLViolet",
	nt = "SLBlack",
	t = "SLBlack",
	v = "SLDarkGreen",
	V = "SLDarkGreen",
	["\22"] = "SLDarkGreen",
	R = "SLPastelViolet",
	c = "SLRed",
})

-- Sections

local function diagnostics_counter()
	local diagnostics = vim.diagnostic.count()
	local fmt = function(key, symbol, highlight)
		local count = diagnostics[key]
		if count == nil then
			return ""
		end

		return format_block(symbol .. tostring(count) .. " ", highlight, 0)
	end

	local result = ""
		.. fmt(vim.diagnostic.severity.ERROR, "", "SLError")
		.. fmt(vim.diagnostic.severity.WARN, "", "SLWarn")
		.. fmt(vim.diagnostic.severity.INFO, "", "SLInfo")
		.. fmt(vim.diagnostic.severity.HINT, "", "SLHint")

	if result ~= "" then
		return format_block(" ", "SLText", 0) .. result
	else
		return ""
	end
end

local function lsp_info()
	local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	local text = "no-lsp"

	if #clients > 0 then
		text = "  "
		for _, client in pairs(clients) do
			local filetypes = client.config.filetypes
			local icon
			if filetypes ~= nil then
				icon = icons.get_icon(filetypes[1])
			end
			if icon ~= nil and icon ~= "" then
				text = text .. icon .. " "
			end
		end
	end
	return format_block(text, "SLLSP", 6)
end

local git_info = function(mode)
	local cwd = vim.fn.getcwd(-1, 0)
	local data = git_cache[cwd]
	if data == nil then
		data = "" -- Leave empty so the block doesn't blink
		git_cache[cwd] = ""

		vim.system({ "git", "rev-parse", "--abbrev-ref", "HEAD" }, { cwd = cwd }, function(obj)
			if obj.code == 0 then
				git_cache[cwd] = vim.trim(obj.stdout)
			else
				git_cache[cwd] = ""
			end
		end)
	end
	return format_block(data, secondary_highlights[mode], 20)
end

-- Export functions

_G.Hkupty = {}

_G.Hkupty.statusline_active = function()
	local mode = vim.api.nvim_get_mode().mode

	local base = {
		mode_strings[mode],
		" ",
		git_info(mode),
	}

	local mode_prefix
	local mode_suffix
	local base_suffix = {
		"%l,%v [%L - %p%%]",
	}

	if mode == "t" or mode == "nt" then
		mode_prefix = {
			"%*",
		}
		mode_suffix = {}
	else
		mode_prefix = {
			" ",
			lsp_info(),
			" ",
			diagnostics_counter(),
			"%*",
			" %f ",
		}
		mode_suffix = {}
	end

	vim.list_extend(base, mode_prefix)
	vim.list_extend(base, { "%=" })
	vim.list_extend(base, mode_suffix)
	vim.list_extend(base, base_suffix)

	return table.concat(base)
end

_G.Hkupty.tabline_active = function()
	local tabs = { "%#TLInactive#" }
	local current = vim.api.nvim_get_current_tabpage()
	for index, tab in pairs(vim.api.nvim_list_tabpages()) do
		local tabstr = tostring(index)
		if tab == current then
			table.insert(tabs, "%#TLActive#")
		end

		table.insert(tabs, "  " .. tabstr .. "  ")

		if tab == current then
			table.insert(tabs, "%m")
		end

		if tab == current then
			table.insert(tabs, "%#TLInactive#")
		end
	end

	vim.list_extend(tabs, {
		"%*",
		"%=",
		"%#SLVisualMode# %{%getcwd(-1, 0)%} ",
	})

	return table.concat(tabs)
end

-- Status and tabline settings

vim.opt.statusline = "%!v:lua.Hkupty.statusline_active()"
vim.opt.tabline = "%!v:lua.Hkupty.tabline_active()"
vim.opt.showtabline = 2
vim.opt.laststatus = 3
