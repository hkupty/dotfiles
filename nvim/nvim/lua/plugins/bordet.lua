local impromptu = require("impromptu")
local bordet = require("bordet")

bordet.config['bordet.task.todoist'] = {
  format = function(data)
    return {
    "  " .. bordet.config.signs.section .. " [" .. data['project-id'] .. "] " .. data.content
    }
  end,
  action = function(element)
  impromptu.ask{
    title = element.content,
    options = {
      open = {description = "Open Task in browser", url = element.url},
      close = {description = "Close Task", id = element.id},
      delete = {description = "Delete Task", id = element.id},

    },
    handler = function(_, opt)
      if opt.index == "open" then
        vim.fn.system('xdg-open "' .. opt.url .. '"')
      else
        vim.fn.system('redis-cli PUBLISH bordet.task.todoist/' .. opt.index .. '-task ' .. opt.id)
      end
      return true
    end
  }
end,
  show = function(_)
    return true
  end
}
bordet.config['bordet.task.github.notifications'] = {
  format = function(data)
    local status = "  [" ..
    data['type']  ..
    "] " .. data.repo .. ": " .. data.title

    return {status}
  end,
  action = function(element)
  impromptu.ask{
    title = element.title,
    options = {
      pr = {description = "Open " .. element['type'], url = element['html-url']},
      mark = {description = "Mark as read", id = element.id}
    },
    handler = function(_, opt)
      if opt.index == 'mark' then
        vim.fn.system('redis-cli PUBLISH bordet.task.github.notifications/mark-as-read ' .. opt.id)
      else
        vim.fn.system('xdg-open "' .. opt.url .. '"')
      end
      return true
    end
  }

  end,
  show = function(_)
    return true
  end

}

