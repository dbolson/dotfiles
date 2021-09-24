require("bufferline").setup()
require('gitsigns').setup{
  signs = {
    add = {hl = 'GitSignsAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
    change = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  }
}
require('lint').linters_by_ft = {
  -- go = {'golangcilint'},
  python = {'flake8'},
  sh = {'shellcheck'},
}
require("nvim_comment").setup({
  comment_empty = false,
  create_mappings = false,
})
require("trouble").setup({
  mode = "lsp_document_diagnostics",
})
require("which-key").setup()
