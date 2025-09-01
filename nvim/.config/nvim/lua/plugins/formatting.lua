return {
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        go = {
          "goimports",
          "golangci-lint",
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
