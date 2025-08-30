return {
  {
    'stevearc/conform.nvim',
    opts = {
      format_on_save = {
        -- lsp_format = "fallback",
      },
      formatters_by_ft = {
        go = {
          "golangci-lint",
          "goimports",
        },
        -- lua = {
        --   "luacheck",
        -- },
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
      },
      notify_no_formatters = true,
      notify_on_error = true,
    },
  },
}
