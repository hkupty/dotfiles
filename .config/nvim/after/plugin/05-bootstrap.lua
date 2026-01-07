local function bootstrapLuaConfig(cachefile, configfile)
	local fd = assert(vim.uv.fs_open(cachefile, 0x0040, 0x1A4))

	local stat = assert(vim.uv.fs_fstat(fd))

	local data = assert(vim.uv.fs_read(fd, stat.size, 0))

	local hash = ""
	local libs = vim.api.nvim_get_runtime_file("lua", true)
	for _, lib in ipairs(libs) do
		hash = vim.fn.sha256(hash .. lib)
	end
	assert(vim.uv.fs_close(fd))

	if data ~= hash then
		local fd = assert(vim.uv.fs_open(cachefile, 0x0201, 0x1A4))
		assert(vim.uv.fs_write(fd, hash))

		local luals = {
			["$schema"] = "https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json",
			["workspace.library"] = libs,
			["diagnostics.globals"] = { "vim" },
			["runtime.version"] = "LuaJIT",
		}

		local fd2 = assert(vim.uv.fs_open(configfile, "w", 0x1A4))

		assert(vim.uv.fs_write(fd2, vim.json.encode(luals, {})))

		assert(vim.uv.fs_close(fd2))
		assert(vim.uv.fs_close(fd))
	end
end

bootstrapLuaConfig(vim.fn.stdpath("cache") .. "/luals-hash", vim.fn.stdpath("config") .. "/.luarc.json")

require("mason").setup()
