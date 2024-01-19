local gitsigns = require('gitsigns')

local function map(mode, l, r, opts)
  opts = opts or {}
  opts.buffer = bufnr
  vim.keymap.set(mode, l, r, opts)
end

gitsigns.setup {
  on_attach = function()
    map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
    map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

    -- Actions
    map({'n', 'v'}, '<space>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<space>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<space>hS', gitsigns.stage_buffer)
    map('n', '<space>hu', gitsigns.undo_stage_hunk)
    map('n', '<space>hR', gitsigns.reset_buffer)
    map('n', '<space>hp', gitsigns.preview_hunk)
    map('n', '<space>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<space>tb', gitsigns.toggle_current_line_blame)
    map('n', '<space>hd', gitsigns.diffthis)
    map('n', '<space>hD', function() gitsigns.diffthis('~') end)
    map('n', '<space>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end,
  yadm = {
    enable = true
  },

  -- Optional feature, enables showing staged blocks
  _signs_staged_enable = true,
}
