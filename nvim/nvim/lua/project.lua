-- luacheck: globals vim
local impromptu = require("impromptu")
local cartographer = require("cartographer")
local config = require("cartographer.config")

config.set{
  project = {
    path = "/opt/code",
    search_command = "fd -t d -d 3 -H '\\.git$' -c never -x echo {//} | uniq"
  },
  files = {
    search_command = "fd -H -L -E '\\.git' -c never -t f",
    custom = {
      {
        description = "nvim://term",
        score = 1,
        self_handler = function()
          vim.api.nvim_command("term")
          return true
        end
      }, {
        description = "nvim://bordet",
        score = 1,
        self_handler = function()
          _G.dashboard()
          return true
        end
      }, {
        description = "nvim://enew",
        score = 1,
        self_handler = function()
          vim.api.nvim_command("enew")
          return true
        end
      }, {
        score = 1,
        description = "nvim://scratch", self_handler = function()
          vim.api.nvim_command("enew | setl breakindent nobuflisted buftype=nofile bufhidden=wipe nolist")
          return true
        end
    }}
  },
  cd = {
    search_command = "fd -c never -t d | sort"
  },
  rx = {
    search_command = "rg --vimgrep --color never"
  },
  search = {
    search_command = "rg --vimgrep --color never -F --"
  }
}

_G.new_file = function()
  local winnr = vim.api.nvim_get_current_win()
  local path
  local fname = impromptu.new.form{
    title = "Create new file",
    options = {
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
  local winnr = vim.api.nvim_get_current_win()
  impromptu.form{
    title = "String to search",
    questions = {
      search = {
        description = "search"
      }
    },
    handler = function(_, selected)
      cartographer.proxy.search{
        parameter = selected.search,
        open_cmd = edit,
        winnr = winnr
      }
      return true
    end
  }
end
