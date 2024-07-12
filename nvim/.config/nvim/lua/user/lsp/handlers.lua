local M = {}

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        {
            name = "DiagnosticSignError",
            text = "",
        },
        {
            name = "DiagnosticSignWarn",
            text = "",
        },
        {
            name = "DiagnosticSignHint",
            text = "",
        },
        {
            name = "DiagnosticSignInfo",
            text = "",
        },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, {
            texthl = sign.name,
            text = sign.text,
            numhl = "",
        })
    end

    local config = {
        float = {
            border = "rounded",
            focusable = false,
            header = "",
            prefix = "",
            source = "always",
            style = "minimal",
        },
        severity_sort = true,
        signs = {
            active = signs,
        },
        underline = true,
        update_in_insert = true,
        virtual_text = false,
    }

    vim.diagnostic.config(config)

    local pop_opts = {
        border = "rounded",
        max_width = 80,
    }
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
                                                 vim.lsp.handlers.hover,
                                                 pop_opts)

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
    vim.lsp.set_log_level("off")
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end

local function lsp_keymaps(bufnr)
    local opts = {
        noremap = true,
        silent = true,
    }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]e", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[e", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float(0, { \"single\", scope = \"line\" })<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>S", ":SymbolsOutline<cr>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>xx", ":Trouble diagnostics toggle<cr>", opts)
end

M.on_attach = function(client, bufnr)
    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
    end
    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
    if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require("cmp_nvim_lsp")

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
