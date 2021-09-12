local g = vim.g

g.lsp_config = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
}

g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    jump_to_mark = "<c-q>",
  },
}
