local treesitter = require('nvim-treesitter.configs')

local ts_langs = {"bash", "lua", "clojure", "go", "json", "regex", "java", "javascript", "python", "yaml"}

treesitter.setup{
    highlight = { enable = ts_langs },
    indent = {enable = ts_langs },
    incremental_selection = {
      enable = ts_langs,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      }
    },
    refactor = {
      highlight_definitions = { enable = ts_langs },
      highlight_current_scope = { enable = ts_langs },
      smart_rename = {
        enable = ts_langs,
        keymaps = {
          smart_rename = "grr",
        },
      },
      navigation = {
        enable = ts_langs,
        keymaps = {
          goto_definition = "gnd",
          list_definitions = "gnD",
          list_definitions_toc = "gO",
          goto_next_usage = "<a-*>",
          goto_previous_usage = "<a-#>",
        },
      },
    },
    textobjects = {
      select = {
        enable = ts_langs,
        keymaps = {
          ["af"] = "@function.outer",
          --["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["if"] = {
            python = "(function_definition) @function",
            cpp = "(function_definition) @function",
            c = "(function_definition) @function",
            java = "(method_declaration) @function",
          },
        },
      },
      swap = {
        enable = ts_langs,
        swap_next = {
          ["<leader>a"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>A"] = "@parameter.inner",
        },
      },
      move = {
        enable = ts_langs,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
}
