-- luacheck: globals vim
local cmp = require('cmp')

local short_name = {
  nvim_lsp = 'lsp',
  nvim_lua = 'nvim',
  treesitter = '🌳'
}


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

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  formatting = {
    fields = { 'abbr', 'menu', 'kind' },
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = short_name[entry.source.name] or entry.source.name

      return vim_item
    end
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-y>'] = cmp.mapping.confirm { select = true },
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
  sources = cmp.config.sources {
    { name = 'nvim_lsp',   max_item_count = 20, group_index = 1 },
    { name = 'nvim_lua',   max_item_count = 20, group_index = 1 },
    { name = 'treesitter', group_index = 1 },
    { name = 'luasnip',    group_index = 2 },
    { name = 'spell',      group_index = 2 },
    { name = 'buffer',     group_index = 2 },
    { name = 'path',       group_index = 2 },
    { name = 'dictionary', group_index = 2,     keyword_length = 2 },
  }
}

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

require("cmp_dictionary").setup {
  exact_length = 2
}
