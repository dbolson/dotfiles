return {
  'yioneko/nvim-vtsls',
  keys = {
    { "<leader>lF", ":lua require('vtsls').commands.rename_file(bufnr, on_resolve, on_reject)<cr>", desc = "Rename file" },
    { "<leader>ld", ":lua require('vtsls').commands.goto_source_definition(bufnr, on_resolve, on_reject)<cr>", desc = "Go to source definition" },
    { "<leader>lf", ":lua require('vtsls').commands.file_references(bufnr, on_resolve, on_reject)<cr>", desc = "Show references of the current file" },
    { "<leader>lp", ":lua require('vtsls').commands.goto_project_config(bufnr, on_resolve, on_reject)<cr>", desc = "open tsconfig.json" },
    { "<leader>lr", ":lua require('vtsls').commands.restart_tsserver(bufnr, on_resolve, on_reject)<cr>", desc = "LSP restart" },
    { "<leader>ls", ":lua require('vtsls').commands.source_actions(bufnr, on_resolve, on_reject)<cr>", desc = "Pick source action" },
  },
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 16184
      }
    }
  }
  -- settings = {
  --   typescript = {
  --     inlayHints = {
  --       parameterNames = { enabled = 'literals' },
  --       parameterTypes = { enabled = true },
  --       variableTypes = { enabled = true },
  --       propertyDeclarationTypes = { enabled = true },
  --       functionLikeReturnTypes = { enabled = true },
  --       enumMemberValues = { enabled = true },
  --     }
  --   },
  -- }
}
