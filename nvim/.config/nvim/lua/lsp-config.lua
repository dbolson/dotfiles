local vim = vim
local coq = require("coq")
local lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspinstall").setup()

local function common_on_attach()
  require("lsp_signature").on_attach({
    -- auto_close_after = 5,
    -- bind = true,
    -- handler_opts = {
    --   border = "single"
    -- },
    hint_prefix = "",
    use_lspsaga = true,
  })
end

local servers = require("lspinstall").installed_servers()
for _, server in pairs(servers) do
  local client = lsp[server]
  local config = vim.g.lsp_config[server] or client
  lsp[server].setup(coq.lsp_ensure_capabilities({
    on_attach = config.on_attach or common_on_attach,
    settings = config.settings or {}
  }))
end

vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { text = "", numhl = "LspDiagnosticsDefaultError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { text = "", numhl = "LspDiagnosticsDefaultWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { text = "", numhl = "LspDiagnosticsDefaultInformation" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { text = "", numhl = "LspDiagnosticsDefaultHint" }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = { prefix = "" },
    signs = true,
    update_in_insert = false,
  }
)
