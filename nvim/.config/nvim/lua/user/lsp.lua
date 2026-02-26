vim.lsp.enable({
  'basedpyright',
  'bashls',
  'expert',
  'gopls',
  'jqls',
  'lua_ls',
  -- 'sqlls',
  -- 'ts_ls',
  -- 'vtsls',
  'tsgo',
})

vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
    },
  },
  underline = true,
  update_in_insert = true,
  virtual_text = false,
})
