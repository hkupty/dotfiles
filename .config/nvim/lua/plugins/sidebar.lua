local sidebar_nvim = require("sidebar-nvim")

local fetch_gh = function()
  local all = vim.fn.json_decode(vim.fn.system("hub api /notifications"))
  local grouped = {}
  for _, nt in ipairs(all) do
    local repo = nt.repository.full_name
    local tbl = grouped[repo] or {
      repository = nt.repository,
      notifications = {}
    }
    nt.repository = nil

    table.insert(tbl.notifications, nt)
    grouped[repo] = tbl
  end

  return grouped
end

_G.fetch_gh = fetch_gh
local notifications_cache = {}
local draw_cache = {}

-- TODO Add keyword to expand notification groups
-- TODO Open notification directly
local gh_notifications = {
  title = "Github Notifications",
  icon = "",
  update = function(ctx)
    notifications_cache = fetch_gh()
  end,
  draw = function(ctx)
    local tbl = {}
    draw_cache = {}

    for group, nt in pairs(notifications_cache) do
      table.insert(tbl, " " .. group .. " (".. vim.tbl_count(nt.notifications) .. ")")
      table.insert(draw_cache, group)
    end
    return tbl
  end,
  bindings = {
  ['o'] = function(line, _)
      local group = draw_cache[line + 1]
      local notification = notifications_cache[group]

       vim.fn.system("xdg-open ".. notification.repository.html_url )
  end
  }
}

--- Pomodoro

local pomodoro_state = {}

local pomodoro = {
  title = "Pomodoro",
  icon = "",
  update = function(ctx)
    pomodoro_state.text = vim.fn.system("pomo status")
  end,
  draw = function(ctx)
  return pomodoro_state.text
  end,
  bindings = {
    ['c'] = function(_, _)
      vim.ui.input({prompt = "Pomodoro title: "}, function(title)
        if title ~= nil then
          vim.ui.input({prompt = "Pomodoro duration: "}, function(duration)
            vim.ui.input({prompt = "Number of pomodoros: "}, function(number)
              cmd = "pomo create"
              if duration ~= nil then
                cmd = cmd .. " -d " .. duration
              end

              if number ~= nil then
                cmd = cmd .. " -p " .. number
              end

              vim.fn.system(cmd .. title)
            end)
          end)
        end
      end)
    end
  }



}

sidebar_nvim.setup({
  disable_default_keybindings = 0,
  bindings = { ["q"] = function() sidebar_nvim.close() end },
  hide_statusline = true,
  open = true,
  side = "left",
  initial_width = 29,
  update_interval = 1000,
  sections = { "datetime", pomodoro, "todos", gh_notifications ,"git", "diagnostics", "containers", "symbols" },
  section_separator = {"", "─────────────────────────", ""},
  datetime = {
    icon = "",
    format = "[%U] %y-%m-%d, %H:%M",
    clocks = {
    { name = "local" },
    }
  }
})
