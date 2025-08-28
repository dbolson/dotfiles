-- nvim-lint
vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function()
    -- vim.cmd("silent! FormatWrite")
    vim.cmd("FormatWrite")
  end,
  pattern = { "*" },
})

-- go
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost"}, {
  callback = function()
    vim.cmd("setlocal noexpandtab tabstop=4 shiftwidth=4")
  end,
  pattern = { "*.go" },
})

local g = vim.api.nvim_create_augroup("lsp_document_highlight", {})
vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.lsp.buf.document_highlight()
  end,
  group = g,
  pattern = { "*" },
})
vim.api.nvim_create_autocmd('CursorMoved', {
  callback = function()
    vim.lsp.buf.clear_references()
  end,
  group = g,
  pattern = { "*" },
})
