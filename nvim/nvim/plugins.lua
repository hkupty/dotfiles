-- luacheck: globals unpack vim
-- Aliases
local nvim = vim.api

-- Libs
local inspect = require("inspect")


-- Global utilities
_G.tap = function(obj)
  print(inspect(obj))
  return obj
end

_G.reload = function(obj)
  for k, _ in pairs(package.loaded) do
    if string.sub(k, #obj) == obj then
      package.loaded[k] = nil
    end
  end
end


-- Plugins
local impromptu = require("impromptu")
local iron = require("iron")
local trex = require("trex")
local nvimux = require('nvimux')

local nrepl = require('acid.nrepl')
local connections = require('acid.connections')


nvimux.config.set_all{
  open_term_by_default = true,
  new_window_buffer = 'single',
  quickterm_direction = 'botright',
  quickterm_orientation = 'vertical',
  quickterm_scope = 't',
  quickterm_size = '80',
  new_term = "call IronStartRepl('sh', 0, 1)",
}

nvimux.bindings.bind_all{
    {'s', ':NvimuxHorizontalSplit', {'n', 'v', 'i', 't'}},
    {'v', ':NvimuxVerticalSplit', {'n', 'v', 'i', 't'}},
    {'**', ':NvimuxSet new_tab=term', {'n', 'v', 'i', 't'}},
    {'*-', ':NvimuxSet new_tab=""', {'n', 'v', 'i', 't'}},
    {'$', ':TrexInvoke', {'n', 'v', 'i', 't'}},
}

nvimux.bootstrap()

iron.core.add_repl_definitions{
  clojure = {
    lein_connect = {
      command = {"lein", "repl", ":connect"}
    }
  },
  lua = {
    nero = {
      command = {"nero"}
    }
  },
  viml = {
    nero = {
      command = {"nero"}
    }
  }
}

iron.core.set_config {
  preferred = {
    python = "ipython",
    clojure = "lein"
  }
}

_G.set_preferred_repl = function()
  local cb = nvim.nvim_get_current_buf()
  local ft = nvim.nvim_buf_get_option(cb, 'filetype')
  local defs = iron.core.list_definitions_for_ft(ft)

  local opts = {}

  for _, kv in ipairs(defs) do
    local descr
    if type(kv[2].command) == "table" then
      descr = table.concat(kv[2].command, " ")
    else
      descr = kv[2].command
    end

    opts[kv[1]] = {
      description = descr
    }
  end

  impromptu.ask{
    question = "Select preferred repl",
    options = opts,
    handler = function(_, opt)
      iron.core.set_config{preferred = {[ft] = opt}}
      return true
    end
  }
end

_G.new_repl_def = function()
  local cb = nvim.nvim_get_current_buf()
  local ft = nvim.nvim_buf_get_option(cb, 'filetype')

  impromptu.form{
    title = "New repl definition for " .. ft .. ":",
    questions = {
      command = {
        description = "Command"
      },
      id = {
        description = "Id"
      }
    },
    handler = function(_, answers)
      iron.core.add_repl_definitions{
        [ft] = {
          [answers.id] = {
            command = answers.command
          }
        }
      }

      return true
    end
  }

end

_G.spawn_repl = function(ft)
  if ft == nil then
    local cb = nvim.nvim_get_current_buf()
    ft = nvim.nvim_buf_get_option(cb, 'filetype')
  end
  local opts = {}
  local defs = iron.core.list_definitions_for_ft(ft)

  for _, kv in ipairs(defs) do
    local descr
    if type(kv[2].command) == "table" then
      descr = table.concat(kv[2].command, " ")
    else
      descr = kv[2].command
    end

    opts[kv[1]] = {
      description = descr,
      data = kv[2]
    }
  end

  opts._custom = {
    description = "New definition"
  }

  impromptu.ask{
    question = "Select repl definition",
    options = opts,
    handler = function(session, opt)
      if opt == "_custom" then
        session:stack(impromptu.new.form{
            title = "New repl definition for " .. ft .. ":",
            questions = {
              command = {
                description = "Command"
              },
              id = {
                description = "Id"
              }
            },
            handler = function(inner_session, answers)
              impromptu.session.pop_from(inner_session)
              inner_session.lines[answers.id] = {
                description = answers.command,
                data = {
                    command = answers.command
                }
              }
              end
            })
      else
        iron.core.repl_from_def(ft, opt.data)
        trex.attach(ft)
        return true
      end
    end
  }

end

_G.test_filter = function()
  _G.session = impromptu.filter{
    title = "Testing filter",
    options = {
      {description = "This is the first line"},
      {description = "And then this one is the second line"},
      {description = "Finally, a third line to finish this"}
    },
    handler = function(_, selected)
      tap(selected)
      return true
    end
  }
end

_G.add_value = function(val)
  _G.session:update({description = val})
end

_G.search_cache = {}

_G.search = function(open_cmd)

  impromptu.form{
    title = "Search for",
    questions = {
       query = {
        description = "Query"
      }
    },
    handler = function(session, answers)
      if answers.query == "" then
        return
      end

      local cb = nvim.nvim_get_current_buf()
      local winnr = nvim.nvim_call_function("bufwinnr", {cb})
      local cwd = nvim.nvim_call_function("getcwd", {})

      local obj = impromptu.session.stack_into(session, "filter", {
          title = "🔎  [" .. answers.query .. "]",
          options = {},
          handler = function(_, ret)
            nvim.nvim_command(
              winnr .. "wincmd w | " ..
              (open_cmd or "edit") .. '+' .. ret.ln .. " " .. cwd .. "/" .. ret.fpath
            )
            return true
          end
      })

      _G.search_cache[obj.session_id] = { ui = obj }

      local fn = {
      'function! MyHandle_' .. obj.session_id .. '(c, dt, s)',
        'call luaeval("add_to_search(' .. obj.session_id .. ', _A)", a:dt)',
      'endfunction'
      }
      nvim.nvim_call_function("execute", {fn})
      _G.search_cache[obj.session_id].job = nvim.nvim_call_function("jobstart", {
          "rg --vimgrep --color never '" .. answers.query .. "'" , {
            on_stdout = "MyHandle_" .. obj.session_id,
            cwd = cwd
          }
        }
      )

    end
  }
end

_G.add_to_search = function(ui_id, dt)
  if _G.search_cache[ui_id].ui.destroyed then
    nvim.nvim_call_function("chanclose", {_G.search_cache[ui_id].job})
  else
    for _, line in ipairs(dt) do
      local match = line:gmatch("[^:]+")
      _G.search_cache[ui_id].ui:update{
        description = line,
        fpath = match(),
        ln = match(),
        column = match()
      }
    end
  end

end

nvim.nvim_command("command! -nargs=? SpawnRepl lua spawn_repl(<f-args>)")
