-- luacheck: globals vim
local impromptu = require("impromptu")
local cartographer = require("cartographer")

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
  },
  search = {
    search_command = "rg --vimgrep --color never -F --"
  }
}


_G.new_file = function()
  local cb = vim.api.nvim_get_current_buf()
  local winnr = vim.api.nvim_call_function("bufwinnr", {cb})
  local path
  local fname = impromptu.new.form{
    title = "Create new file",
    questions = {
      fname = {
        description = "File Name"
      }
    },
    handler = function(_, answers)
      vim.api.nvim_command(winnr .. "wincmd w")
      vim.api.nvim_command("belowright vertical new " .. path .. "/" .. answers.fname)
      return true
    end
  }

  cartographer.do_at(function(session, opt)
    path = opt.description
    session:stack(fname)
  end)
end

vim.api.nvim_command("command! -nargs=? NewFile lua new_file()")

_G.grep = function(edit)
  local cb = vim.api.nvim_get_current_buf()
  local winnr = vim.api.nvim_call_function("bufwinnr", {cb})
  impromptu.form{
    title = "String to search",
    questions = {
      search = {
        description = "search"
      }
    },
    handler = function(_, selected)
      cartographer.search(selected.search, edit, winnr)
      return true
    end
  }
end
