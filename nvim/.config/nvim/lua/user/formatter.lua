local util = require("formatter.util")

require("formatter").setup({
    filetype = {
        c = {
            function()
                return {exe = "clang-format", stdin = true}
            end,
        },
        go = {require("formatter.filetypes.go").goimports},
        java = {
            function()
                return {
                    exe = "google-java-format",
                    args = {util.escape_path(util.get_current_buffer_file_path())},
                    stdin = true,
                }
            end,
        },
        javascript = {
            function()
                return {
                    exe = "./node_modules/prettier/bin-prettier.js",
                    args = {
                        "--stdin-filepath",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                    try_node_modules = true,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "lua-format",
                    args = {
                        "--column-limit=100",
                        "--chop-down-table",
                        "--extra-sep-at-table-end",
                        "--no-keep-simple-control-block-one-line",
                        "--no-keep-simple-function-one-line",
                        "--single-quote-to-double-quote",
                    },
                    stdin = true,
                }
            end,
        },
        python = {
            require("formatter.filetypes.python").black,
            require("formatter.filetypes.python").isort,
        },
        sh = {
            function()
                return {exe = "shfmt", args = {"-i", 2}, stdin = true}
            end,
        },
        sql = {
            function()
                return {
                    exe = "sql-formatter",
                    args = {
                        "--config ~/sql-formatter.json",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                }
            end,
        },
    },
})
