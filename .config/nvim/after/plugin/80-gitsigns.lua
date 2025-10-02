-- luacheck: globals vim

local gitsigns = require('gitsigns')


gitsigns.setup {
  on_attach = function(bufnr)
    vim.keymap.set('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, buffer = bufnr })
    vim.keymap.set('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, buffer = bufnr })

    -- Actions
    vim.keymap.set({ 'n', 'v' }, '<space>hs', ':Gitsigns stage_hunk<CR>', { buffer = bufnr })
    vim.keymap.set({ 'n', 'v' }, '<space>hr', ':Gitsigns reset_hunk<CR>', { buffer = bufnr })
    vim.keymap.set('n', '<space>hS', gitsigns.stage_buffer, { buffer = bufnr })
    vim.keymap.set('n', '<space>hu', gitsigns.undo_stage_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<space>hR', gitsigns.reset_buffer, { buffer = bufnr })
    vim.keymap.set('n', '<space>hp', gitsigns.preview_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<space>hb', function() gitsigns.blame_line { full = true } end, { buffer = bufnr })
    vim.keymap.set('n', '<space>tb', gitsigns.toggle_current_line_blame, { buffer = bufnr })
    vim.keymap.set('n', '<space>hd', gitsigns.diffthis, { buffer = bufnr })
    vim.keymap.set('n', '<space>hD', function() gitsigns.diffthis('~') end, { buffer = bufnr })
    vim.keymap.set('n', '<space>td', gitsigns.toggle_deleted, { buffer = bufnr })

    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end,
}
