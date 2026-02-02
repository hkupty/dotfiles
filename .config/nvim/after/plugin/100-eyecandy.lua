require("colorizer").setup()

local fidget = require("fidget")

fidget.setup({})

vim.notify = require("fidget.notification").notify
