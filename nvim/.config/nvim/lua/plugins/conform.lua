return {
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        lsp_format = "fallback",
      },
      formatters = {
        kulala = {
          command = "kulala-fmt",
          args = { "format", "$FILENAME" },
          stdin = false,
        },
      },
      formatters_by_ft = {
        elixir = {
          "mix",
        },
        go = {
          "goimports",
          "golangci-lint",
        },
        http = {
          "kulala",
        },
        json = {
          "jq",
        },
        -- lua = {
        --   "luacheck",
        -- },
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
        sql = {
          "sqlfmt",
        },
        typescript = {
          "prettier",
        },
        ["*"] = {
          "trim_newlines",
          "trim_whitespace",
        },
      },
      notify_no_formatters = true,
      notify_on_error = false,
    },
  },
}
