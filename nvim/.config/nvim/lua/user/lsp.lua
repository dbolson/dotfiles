-- TODO: get these working
vim.lsp.enable("bashls")
vim.lsp.enable("clangd")
vim.lsp.enable("eslint")
vim.lsp.enable("jsonls")
vim.lsp.enable("sqlls")
vim.lsp.enable("ts_ls")

vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
vim.lsp.enable("pyright")

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method("textDocument/completion") then
      vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      -- manually start autocompletion
      vim.keymap.set("i", "<C-Space>", function()
        vim.lsp.completion.get()
      end)
    end
  end
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
require("lsp_signature").setup({
  hint_prefix = "", -- no panda
})
