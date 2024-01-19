-- luacheck: globals vim
require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    kotlin = {
      require("formatter.filetypes.kotlin").ktlint
    },
    go = {
      function()
        return {
          exe = "gofmt",
          args = { "-w" },
          stdin = false
        }
      end
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

require('lint.linters.ktlint').args = {
  "--reporter=json", "--stdin"
}


require('lint').linters_by_ft = {
  sh = { "shellcheck", },
  bash = { "shellcheck", },
  yaml = { "yamllint", },
  kotlin = { "ktlint", },
  lua = { "luacheck", },
  markdown = { "proselint", "vale" },
  NeogitCommitMessage = { "proselint", "vale" },
  pullrequest = { "proselint", "vale" },
}

local filetypes = {
  "kotlin",
  "lua",
  "go",
  "rust",
  "yaml",
  "markdown",
  "bash",
  "sh",
  "java",
}

local format_then_lint = function()
  vim.cmd [[Format]]
  require("lint").try_lint()
end

vim.api.nvim_create_augroup("hkupty", {})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = "hkupty",
  pattern = filetypes,
  callback = function()
    vim.api.nvim_create_autocmd({ "BufWritePost", "CursorHold" }, {
      group = "hkupty",
      buffer = vim.api.nvim_get_current_buf(),
      callback = function() format_then_lint() end
    })
  end
})
