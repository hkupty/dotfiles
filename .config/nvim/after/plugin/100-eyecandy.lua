local fidget = require("fidget")

fidget.setup({})

vim.notify = require("fidget.notification").notify
require("vim._core.ui2").enable()
