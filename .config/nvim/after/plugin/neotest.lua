require("neotest").setup {
  adapters = {
    require("neotest-java") {
      ignore_wrapper = false
    },
    require("neotest-go") {
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s" }
    }
  }
}
