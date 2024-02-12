local g = vim.g

g.lsp_config = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            "vim",
          },
        },
      }
    },
  },
}
