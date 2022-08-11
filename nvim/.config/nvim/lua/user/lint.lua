require("lint").linters_by_ft = {
    go = {
        "golangcilint",
    },
    python = {
        "flake8",
    },
    sh = {
        "shellcheck",
    },
}
local shellcheck = require("lint.linters.shellcheck")
table.insert(shellcheck.args, "-x")
