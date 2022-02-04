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
      attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_command("tcd ".. selection[1])
      end)
      return true
    end,
    }):find()
end

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
      attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.api.nvim_command("tcd ".. selection[1])
      end)
      return true
    end,
    }):find()
end

require('telescope').load_extension('fzy_native')


local mapper = function(opt)
  vim.keymap.set ( 'n', opt.lhs or opt[1], function()
      (opt.fn or opt[2])(opt.arg or opt[3] or {})
  end, {}
	)
end

local ivy = require('telescope.themes').get_ivy({})
mapper{"<C-p>", require'telescope.builtin'.find_files, ivy}
mapper{"<C-l>", require'telescope.builtin'.buffers, ivy}
mapper{"<C-g>", require'telescope.builtin'.git_status, ivy}
mapper{"<C-M-f>", require'telescope.builtin'.live_grep, ivy}

mapper{"<C-M-p>", project_folders, ivy}
