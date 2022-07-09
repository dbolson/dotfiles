local vim = vim
local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("nvim-lsp-installer").setup()
for _, server in ipairs {
    "bashls", "clangd", "gopls", "sumneko_lua", "pyright", "sqls", "tsserver",
} do
    lspconfig[server].setup({
        on_attach = function(client, bufnr)
            require("nvim-navic").attach(client, bufnr)
        end,
    })
end

lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}, -- removes "global vim is undefined" warning from line 1
            },
        },
    },
}

require("lsp_signature").setup({
    floating_window = false,
    hint_prefix = "", -- no panda
})
require("lspsaga").setup({code_action_icon = ""})

vim.fn.sign_define("LspDiagnosticsSignError",
                   {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning",
                   {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation",
                   {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint",
                   {text = "", numhl = "LspDiagnosticsDefaultHint"})

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {prefix = ""},
        signs = true,
        update_in_insert = false,
    })

-- Hover doc popup
local pop_opts = {border = "rounded", max_width = 80}
vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
