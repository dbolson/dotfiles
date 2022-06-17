local home = os.getenv("HOME")
local util = require("formatter.util")

require("formatter").setup({
    filetype = {
        go = {
            function()
                return {exe = "goimports", stdin = true}
            end,
        },
        java = {
            function()
                return {
                    exe = "java",
                    args = {
                        "-jar", home .. "/.local/jars/google-java-format.jar",
                        "-",
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
            function()
                return {exe = "black", args = {"-q", "-"}, stdin = true}
            end,
        },
        sh = {
            function()
                return {exe = "shfmt", args = {"-i", 2}, stdin = true}
            end,
        },
        sql = {
            function()
                return {
                    exe = "sqlformat",
                    args = {
                        "--reindent", "--keywords upper",
                        util.escape_path(util.get_current_buffer_file_path()),
                    },
                    stdin = true,
                }
            end,
        },
    },
})
