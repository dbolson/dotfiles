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
                    args = {
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                }
            end,
        },
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                    stdin = true,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "lua-format",
                    args = {
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
