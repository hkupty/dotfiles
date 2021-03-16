
local el = require("el")
local acid_conns = require("acid.connections")
local acid = require("acid")
local classifier = require("classifier")

--[[ colorscheme ]]--

vim.cmd("highlight default link ElNrepl Normal")


--[[/ colorscheme ]]--

el.setup {
  generator = function()
    local builtin = require("el.builtin")
    local sections = require("el.sections")
    local exts = require("el.extensions")
    local subscribe = require("el.subscribe")

    local segments = {
      exts.gen_mode{format_string = " %s "},
      function(win, buf)
        local session = acid_conns.get(vim.fn.getcwd())
        local admin = acid.admin_session()
        local line = {""}

        if admin ~= nil then
          table.insert(line, ":admin/nrepl")
          table.insert(line, admin[2])
        end

        if session ~= nil then
          table.insert(line, ":nrepl")
          table.insert(line, session[2])
        end

        if #line > 1 then
          table.insert(line, "")
        end

        return sections.highlight("Normal", table.concat(line, " "))(win, buf)
      end,
      sections.split,
      builtin.file,
      builtin.modified_flag,
      sections.split,

    builtin.line, ' : ',  builtin.column,
    sections.collapse_builtin{
      '[',
      builtin.help_list,
      builtin.readonly_list,
      ']',
    },
      subscribe.buf_autocmd(
        "el_file_icon",
        "BufRead",
        function(window, buffer)
          local ft = vim.bo.ft
          if ft == "" then
            return ""
          end
          local extension = classifier.fts(ft)
          local ok, icon, hl = pcall(require("nvim-web-devicons").get_icon, buffer.name, extension)
          if ok and icon ~= nil then
            return sections.highlight(hl, table.concat({"", icon, ft, ""}, " "))(window, buffer)
          else
            return sections.highlight("Normal", table.concat({"", ft, ""}, " "))(window, buffer)

          end
        end),
    }

    return segments
  end
}

