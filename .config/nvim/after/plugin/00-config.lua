-- luacheck: globals vim

--[[ Colors ]]
--
vim.cmd([[set termguicolors]])
-- vim.cmd([[highlight Headline guibg=#1e2718 ]])
-- vim.cmd([[highlight Subline guibg=#21262d ]])
-- vim.cmd([[highlight Detail guibg=#27222E ]])
-- vim.cmd([[highlight CodeBlock guibg=#1c1c1c ]])
-- vim.cmd([[highlight Dash guibg=#D19A66 gui=bold]])

vim.cmd([[set noreadonly]])

vim.cmd([[set number]])
vim.cmd([[set relativenumber]])
vim.cmd([[set cursorline]])
vim.cmd([[set scrolloff=8]])
vim.cmd([[set hidden]])

vim.cmd([[set autoindent]])
vim.cmd([[set smartindent]])
vim.cmd([[set smartcase]])

vim.cmd([[set undofile]])
vim.cmd([[set noswapfile]])
vim.cmd([[set autowriteall]])
vim.cmd([[set writeany]])

-- Also, let me have settings per project
vim.cmd([[set exrc]])
vim.cmd([[set secure]])

-- Global taboptions
vim.cmd([[set tabstop=2]])
vim.cmd([[set shiftwidth=2]])
vim.cmd([[set expandtab]])

-- Option complete
vim.cmd([[set wildmode=full]])
vim.cmd([[set completeopt=noselect]])

-- Conceal
vim.cmd([[set conceallevel=2]])

-- Live substitution
vim.cmd([[set inccommand=split]])

vim.cmd([[set noshowmode]])
vim.cmd([[set noshowcmd]])
vim.cmd([[set mouse=a]])

-- Make whitespaces visible
vim.cmd([[set list listchars=tab:\│\ ,trail:⋅,nbsp:⋅]])
vim.cmd([[set fillchars=vert:\│,fold:\─]])

--[[ Folds ]]
vim.o.foldlevel = 3
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.cmd([[set tags=*/.tags;.tags]])

vim.g.mapleader = ","
vim.g.maplocalleader = "<space>"

--[[ Disable default plugins ]]
vim.g.terminal_scrollback_buffer_size = 9999999
vim.g.loaded_fzf = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.is_bash = 1
vim.g.xml_syntax_folding = 1
-- vim.g.did_load_filetypes = 1

vim.g.markdown_folding = 1
vim.diagnostic.config({})
