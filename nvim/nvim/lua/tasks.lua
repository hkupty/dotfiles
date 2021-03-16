local foam = require("foam")
local errands = require("errands")
local tasks = require("errands.tasks")
local impromptu = require("impromptu")

local pop = {
  description = "Return to previous screen"
}

local with_pop = function(fn)
  return function(session, option)
    if option.index == 'pop' then
      session:pop()
      return false
    else
      return fn(session, option)
    end
  end
end

local _new_task = function()
  return impromptu.new.form{
  title = "New task",
  options = {
    title = {
      description = "Title"
    },
    descr = {
      description = "Task Description"
    }
  },
  handler = function(_, answers)
    errands.task(answers)
    return true
  end
}
end

local _new_note = function()
  return impromptu.new.form{
  title = "New note",
  options = {
    title = {
      description = "Note"
    }
  },
  handler = function(_, answers)
    errands.task(answers)
    return true
  end
}
end

local _show = function(errand)
  return impromptu.new.showcase{
  title = "Show Errand",
  options = errand,
  actions = { pop = pop },
  handler = with_pop(function(session, opt)
    return true
  end)
}
end

local _list = function()
  local err_list = {}
  local title_from_item = function(item)
    return "[" .. tasks.status(item) .. "] " .. item.title
  end

  errands.tasks(function(errands)
    for k, v in pairs(errands) do
      err_list[k] = title_from_item(v)
    end
  end)

  return impromptu.new.showcase{
  title = "List errands",
  options = err_list,
  actions = { pop = pop },
  handler = with_pop(function(session, opt)
    return true
  end)
}
end

local _manage_errand = function(errand)

  return impromptu.new.ask{
    title = "Managing [" .. errand.title .. "]",
    options = {
      pop = pop,
      close = {
        description = "Complete errand"
      },
      show = {
        description = "Show errand"
      }
    },
    handler = with_pop(function(session, opt)
      if opt.index == 'close' then
        errands.upsert(tasks.complete(errand))
        return true
      elseif opt.index == 'show' then
        session:stack(_show(errand))
        return false
      end
    end)
  }

end

local _all_errands = function()
  local opt_from_item = function(item)
    return {
      description = "[" .. tasks.status(item) .. "] " .. item.title,
      errand = item
    }

  end
  local opts = {
    title = "Manage Errands",
    handler = with_pop(function(session, opt)
      if opt.index == 'completed' then
        for _, k in errands.tasks(errands.filters.completed) do
          session.lines[k.id] = opt_from_item(k)
        end
      else
        session:stack(_manage_errand(opt.errand))
      end
      return false
    end),
    options = {
      pop = pop,
      completed = {
        description = "Show completed errands"
      }
    }
  }

  for _, k in errands.tasks(errands.filters.open) do
    opts.options[k.id] = opt_from_item(k)
  end

  return impromptu.new.ask(opts)
end

local _errands = function()
  return impromptu.new.ask{
  title = "Errands",
  options = {
    task = {
      description = "Create new errand"
    },
    note = {
      description = "Write new note"
    },
    list = {
      description = "List errands"
    },
    manage = {
      description = "Manage existing errands"
    }
  },
  handler = function(session, opt)
    errands.read()
    if opt.index == 'task' then
      session:stack(_new_task())
    elseif opt.index == 'note' then
      session:stack(_new_note())
    elseif opt.index == 'list' then
      session:stack(_list())
    elseif opt.index == 'manage' then
      session:stack(_all_errands())
    end
    return false

  end
}
end

_G.tasks = function()
  impromptu.session():stack(_errands()):render()
end

vim.api.nvim_command[[map <C-q> <Cmd>lua tasks()<Cr>]]
