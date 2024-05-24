-- luacheck: globals vim

local map = function(mode, opt)
  local arg
  if (opt.fn or type(opt[2]) == "function") then
    arg = function()
      (opt.fn or opt[2])(opt.arg or opt[3] or {})
    end
  else
    arg = opt[2]
  end

  vim.keymap.set(mode, opt.lhs or opt[1], arg, opt.cfg or opt[4] or {})
end

local nnoremap = function(opt) map('n', opt) end
local vnoremap = function(opt) map('v', opt) end
local inoremap = function(opt) map('i', opt) end
local tnoremap = function(opt) map('t', opt) end

nnoremap { "<C-n>", function()
  require("neogit").open()
end }

nnoremap { "g!", function()
  local bufnr = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_win_set_buf(0, bufnr)
  local opts = {}
  opts.on_exit = function()
    local bufwinid = vim.fn.bufwinid(bufnr)
    local windows = vim.api.nvim_tabpage_list_wins(0)
    print(vim.inspect { bufwinid, windows })
    if #windows == 1 and windows[1] == bufwinid then
      vim.cmd [[new]]
      vim.api.nvim_win_close(bufwinid, true)
    end
  end

  vim.fn.termopen(vim.fn.expand("$SHELL"), opts)
end }

nnoremap { "<leader>rr", function() vim.cmd [[source]] end }
nnoremap { "<leader><leader>", function() vim.cmd [[nohl]] end }

nnoremap { "<leader>e", function()
  vim.cmd [[tabe $MYVIMRC]]
  vim.cmd [[tcd $HOME/.config/nvim]]
end }

vnoremap { '<C-c>', [["+y]] }

inoremap { '<C-v>', [[<esc>"+pa]] }

tnoremap { '<C-v>', [[<C-\><C-n> "+pa]] }

nnoremap { '[d', vim.diagnostic.goto_prev }
nnoremap { ']d', vim.diagnostic.goto_next }
