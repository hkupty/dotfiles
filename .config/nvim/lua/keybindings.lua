-- luacheck: globals vim

local mapper = function(opt)
  vim.keymap.set ( 'n', opt.lhs or opt[1], function()
      (opt.fn or opt[2])(opt.arg or opt[3] or {})
  end
  , {})
end

--mapper{"<C-M-p>", cv2.project}
--mapper{"<C-f>", cv2.cd}
--mapper{"<C-p>", cv2.files}
--mapper{"<C-g>", cv2.dirty}
--mapper{"<C-s>", cv2.checkout}
--mapper{"<C-l>", cv2.buffers}
--mapper{"<C-t>", cv2.todo, {open_cmd = "rightbelow new"}}

mapper{"<C-n>", require("neogit").open}
mapper{"<space>b", require("sidebar-nvim").open}

vim.keymap.set({"n"}, "g!", function()
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, bufnr)
  local opts = {}
  opts.on_exit = function()
    local bufwinid = vim.fn.bufwinid(bufnr)
    while bufwinid ~= -1 do
      if #vim.api.nvim_tabpage_list_wins(0) == 0 then
        local newbuf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_win_set_buf(bufwinid, bufnr)
        break
      else
        vim.api.nvim_win_close(bufwinid, true)
        bufwinid = vim.fn.bufwinid(bufnr)
      end
    end
  end

  vim.fn.termopen(vim.fn.expand("$SHELL"), opts)

  end, {})
