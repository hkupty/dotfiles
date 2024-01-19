-- luacheck: globals vim
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local project_folders = function(opts)
  opts = opts or {}
  local find_command = {
    "fd", ".git$", vim.fn.expand("$CODE"), "-td", "-H", "-x", "echo", "{//}"
  }

  pickers.new(opts, {
    prompt_title = "Select project folder",
    finder = finders.new_oneshot_job(find_command, opts),
    previewer = conf.file_previewer(opts),
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr, _map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_command("tcd " .. selection[1])
      end)
      return true
    end,
  }):find()
end

require('telescope').load_extension('fzy_native')


local mapper = function(opt)
  vim.keymap.set('n', opt.lhs or opt[1], function()
    (opt.fn or opt[2])(opt.arg or opt[3] or {})
  end, {})
end

-- Files
mapper { "<C-l>", require 'telescope.builtin'.buffers }
mapper { "<C-p>", require 'telescope.builtin'.find_files }
mapper { "<C-M-f>", require 'telescope.builtin'.live_grep }
mapper { "<C-M-r>", require 'telescope.builtin'.resume }
mapper { "<C-M-p>", project_folders }

-- Fixing
mapper { "<C-q>f", require 'telescope.builtin'.quickfix }
mapper { "<C-q>d", require 'telescope.builtin'.diagnostics }

-- Git-related
mapper { "<C-g>f", require 'telescope.builtin'.git_status }
mapper { "<C-g>b", require 'telescope.builtin'.git_branches }
mapper { "<C-g>c", require 'telescope.builtin'.git_commits }
mapper { "<C-g>C", require 'telescope.builtin'.git_bcommits }
mapper { "<C-g>s", require 'telescope.builtin'.git_stash }
mapper { "<C-space>", require 'telescope'.extensions.git_worktree.git_worktrees }
mapper { "<C-M-space>", require 'telescope'.extensions.git_worktree.create_git_worktree }

-- treesitter
mapper { "<C-s>t", require 'telescope.builtin'.treesitter }

require('telescope').setup {
  defaults = {
    layout_strategy = "bottom_pane",
    layout_config = {
      height = 0.4
    },
    mappings = {
      i = {
        ["<c-space>"] = function(prompt_bufnr)
          require("telescope.actions.generate").refine(prompt_bufnr, {})
        end,
      },
    },
    border = true,
    sorting_strategy = "ascending"
  },
}
