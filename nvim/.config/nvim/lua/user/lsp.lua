vim.lsp.enable({
  -- "bashls",
  -- "clangd",
  -- "eslint",
  "gopls",
  "lua_ls",
  "pyright",
  -- "sqlls",
  -- "ts_ls",
})

vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  underline = true,
  update_in_insert = true,
  virtual_text = false,
})

require("fidget").setup({})
