return {
  {
    'stevearc/conform.nvim',
    opts = {
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
          "kulala-fmt",
        },
        json = {
          "jq",
        },
        lua = {
          "luacheck",
        },
        python = {
          "ruff_fix",
          "ruff_format",
          "ruff_organize_imports",
        },
        sql = {
          "sqlfmt",
        },
        typescript = {
          "biome", "biome-organize-imports", "prettier"
        },
        ["*"] = {
          "trim_newlines",
          "trim_whitespace",
        },
      },
      notify_no_formatters = true,
      notify_on_error = false,
    },
    keys = {
      {
        "<leader>F",
        function()
          require("conform").format({ async = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
  },
}
