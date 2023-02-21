require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "bashls",
        "eslint",
        "gopls",
        "jsonls",
        "lua_ls",
        "pyright",
        "sqls",
        "tsserver",
        -- "clangd",
        -- "jdtls",
    },
})

local opts = {
    capabilities = require("user.lsp.handlers").capabilities,
    on_attach = require("user.lsp.handlers").on_attach,
}

require("mason-lspconfig").setup_handlers({
    function(server_name)
        if server_name == "jsonls" then
            local custom_opts = require("user.lsp.settings.lang-json")
            opts = vim.tbl_deep_extend("force", custom_opts, opts)
        end
        if server_name == "lua_ls" then
            local custom_opts = require("user.lsp.settings.lang-lua")
            opts = vim.tbl_deep_extend("force", custom_opts, opts)
        end
        if server_name == "pyright" then
            local custom_opts = require("user.lsp.settings.lang-python")
            opts = vim.tbl_deep_extend("force", custom_opts, opts)
        end
        require("lspconfig")[server_name].setup(opts)
    end,
})
