return {
  cmd = { 'gopls' },
  filetypes = {
    'go',
    'gomod',
    'gosum',
    'gotmpl',
    'gowork',
  },
  root_markers = { 'go.mod', 'go.work', '.git' },
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
