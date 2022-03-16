local cmp = require('cmp')
local luasnip = require("luasnip")
local neogen = require("neogen")

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

cmp.setup{
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = entry.source.name

      return vim_item
    end
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
       luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<M-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
         cmp.mapping.close()
      end
      if neogen.jumpable() then
        neogen.jump_next()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, {"i", "s"}),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
         cmp.mapping.close()
      end
      if neogen.jumpable(true) then
        neogen.jump_prev()
      elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
      else
        vim.api.nvim_input("<S-Tab>")
      end
    end, {"i", "s"}),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources{
    { name = 'nvim_lsp', max_item_count = 20, group_index = 1},
    { name = 'luasnip', group_index = 1},
    { name = 'nvim_lua', max_item_count = 20, group_index = 1},
    { name = 'treesitter', group_index = 1},
    { name = 'orgmode', group_index = 1},
    { name = 'spell', group_index = 2},
    { name = 'buffer', group_index = 2},
  }
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
  --sources = cmp.config.sources({
    --{ name = 'path' }
  --}, {
    --{ name = 'cmdline' }
  --})
--})


vim.keymap.set({'i', 's'}, '<S-Tab>', function()
  if cmp.visible() then
     cmp.mapping.close()
  end
  if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      return vim.api.nvim_replace_termcodes("<S-Tab>", true, true, true)
  end
end, {silent = true})
