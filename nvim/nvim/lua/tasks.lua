local foam = require("foam")
local errands = require("errands")
local impromptu = require("impromptu")

local _new_task = impromptu.new.form{
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
    errands.task{
      title = answers.title
    }

    return true
  end
}

_G.new_task = function()
  impromptu.session():stack(_new_task):render()
end
