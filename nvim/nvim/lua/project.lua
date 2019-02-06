-- luacheck: globals vim
local impromptu = require("impromptu")
local cartographer = require("cartographer")
local inspect = require("inspect")

cartographer.config{
  project = {
    root = "/opt/code",
    search_command = "fd -t d -d 3 -H '\\.git$' -c never -x echo {//}"
  },
  files = {
    search_command = "fd -c never -t f"
  },
  folder = {
    search_command = "fd -c never -t d"
  },
  rx = {
    search_command = "rg --vimgrep --color never"
  }
}

_G.new_file = function(open_cmd)
  local path
  local fname = impromptu.new.form{
    title = "Create new file",
    questions = {
      fname = {
        description = "File Name"
      }
    },
    handler = function(_, answers)
      vim.api.nvim_command((open_cmd or "edit") .. " " .. path .. "/" .. answers.fname)
      local last_b = vim.api.nvim_call_function("bufnr", {"$"})
      local last_winnr = vim.api.nvim_call_function("bufwinnr", {last_b})
      vim.api.nvim_command(last_winnr .. "wincmd w")
      return true
    end
  }


  print(inspect(fname))


  cartographer.do_at(function(session, opt)
    path = opt.description
    session:stack(fname)
  end)
end

vim.api.nvim_command("command! -nargs=? NewFile lua new_file(<f-args>)")
