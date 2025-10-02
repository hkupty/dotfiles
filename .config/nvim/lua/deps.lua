-- luacheck: globals vim usedepdeps
local code = vim.fn.expand("$CODE")

require("lazy").setup({
	{ --Sane defaults for fast init
		"lewis6991/impatient.nvim",
	},

	{ "dstein64/vim-startuptime" },

	{ -- Utilities
		"williamboman/mason.nvim",
		opts = {},
	},

	{ -- Notifications (+eyecandy)
		"j-hui/fidget.nvim",
		opts = {
			progress = {
				lsp = {
					log_handler = true,
				},
			},
		},
	},

	{ "rebelot/kanagawa.nvim" },

	{ -- File navigation
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
		},
	},

	{ -- git interface
		"TimUntersberger/neogit",
		opts = {
			commit_popup = "vertical split",
			popup = {
				kind = "vsplit",
			},
			preview_buffer = {
				kind = "vsplit",
			},
			signs = {
				section = { "+", "-" },
				item = { "+", "-" },
			},
		},
	},

	{ -- TMUX bindings
		dir = code .. "/vigemus/nvimux",
	},

	{ -- Search TODO comments
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			search = {
				command = "todo-zen",
				args = {
					"--max-src-depth",
					"0",
				},
			},
		},
	},

	{ -- Filesystem tinkering
		"stevearc/oil.nvim",
		opts = {
			keymaps = {
				["<C-p>"] = false,
			},
		},
	},

	{ -- Autocompletion + snippets
		"Saghen/blink.cmp",
		version = "*",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		opts = {
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
			signature = { enabled = true },
			completion = {
				keyword = { range = "prefix" },
				accept = { auto_brackets = { enabled = true } },
				documentation = { auto_show = true, auto_show_delay_ms = 300 },
				list = {
					selection = {
						preselect = false,
						auto_insert = true,
					},
				},
			},
			keymap = {
				preset = "none",

				["<C-n>"] = { "show", "select_next", "fallback" },
				["<C-p>"] = { "show", "select_prev", "fallback" },

				["<C-e>"] = { "cancel", "fallback" },
				["<C-k>"] = { "show_documentation", "hide_documentation" },
				["<C-y>"] = { "select_and_accept" },
				["<Cr>"] = { "accept", "fallback" },

				["<C-space>"] = { "cancel", "fallback" },
			},
		},
	},

	{ -- Git annotations
		"lewis6991/gitsigns.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{ -- Lint
		"mfussenegger/nvim-lint",
	},

	{ -- Formatter
		"stevearc/conform.nvim",
	},

	{ -- Treesitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
	},

	-- Eyecandy
	{ "kyazdani42/nvim-web-devicons", opts = {} },

	--- [[ UNFILTERED/UNCATEGORIZED ]] ---

	-- Colors
	{ "norcalli/nvim-colorizer.lua" },

	-- Spelling
	{ "mateusbraga/vim-spell-pt-br" },

	-- Repls
	-- { dir = code .. '/vigemus/iron.nvim' },
	-- { dir = code .. '/vigemus/trex.nvim' },

	-- Lua tests
	-- { dir = code .. '/hkupty/runes.nvim' },

	-- Prompt utils
	-- { dir = code .. '/vigemus/impromptu.nvim' },

	-- filetype tinkering
	-- { dir = code .. '/vigemus/classifier.nvim' },

	-- Points to where I want
	-- { dir = code .. '/vigemus/pointer.nvim' },

	-- Tpope stuff
	{ "tpope/vim-surround" },
	{ "tpope/vim-speeddating" },
	{ "tpope/vim-repeat" },
	{ "tpope/vim-abolish" },
	{ "tpope/vim-eunuch" },

	-- Syntax specific and some more stuff

	-- Clojure
	{ dir = code .. "/clojure-vim/acid.nvim", ft = "clojure" },
	{ dir = code .. "/clojure-vim/jazz.nvim", ft = "clojure" },
	{ dir = code .. "/clojure-vim/async-clj-highlight", ft = "clojure" },
	{ "guns/vim-sexp", ft = "clojure" },
	{ "clojure-vim/async-clj-omni", ft = "clojure" },
	{ "fholiveira/vim-clojure-static", ft = "clojure", branch = "hack-update" },

	{ "ekalinin/Dockerfile.vim", ft = { "Dockerfile" } },
	{ "elzr/vim-json", ft = { "json" } },
	{ "udalov/kotlin-vim", ft = { "kotlin" } },
	{ "pedrohdz/vim-yaml-folds", ft = { "yaml" } },
	{ "jvirtanen/vim-hcl", ft = { "hcl" } },
	{ "vito-c/jq.vim", ft = { "jq" } },
	{ "ray-x/go.nvim", ft = { "go" } },
	{ "aklt/plantuml-syntax", ft = { "puml" } },
	{ "jjo/vim-cue", ft = { "cue" } },
})
