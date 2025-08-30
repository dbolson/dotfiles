-- TODO: get these working
-- vim.lsp.enable("bashls")
-- vim.lsp.enable("clangd")
-- vim.lsp.enable("eslint")
-- vim.lsp.enable("jsonls")
-- vim.lsp.enable("sqlls")
-- vim.lsp.enable("ts_ls")

vim.lsp.enable({
  "gopls",
  "lua_ls",
  "pyright",
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
