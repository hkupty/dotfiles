return {
	cmd = { "gopls" },
	filetypes = { "go" },
	root_markers = { "go.mod", "go.sum" },
	settings = {
		gopls = {
			usePlaceholders = true,
			analyses = {
				shadow = true,
			},
		},
	},
}
