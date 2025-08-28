require("neotest").setup({
    adapters = {
        require("neotest-golang"),
        require("neotest-python")({
            runner = "pytest",
        }),
    },
})
