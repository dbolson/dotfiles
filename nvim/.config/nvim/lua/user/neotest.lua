require("neotest").setup({
  adapters = {
    require("neotest-jest"),
    require("neotest-golang"),
    require("neotest-python")({
      runner = "pytest",
    }),
  },
})
