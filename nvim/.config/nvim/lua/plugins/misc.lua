require("fidget").setup()
require('gitsigns').setup({
  signs = {
    add = {hl = 'GitSignsAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
    change = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  }
})
require('lint').linters_by_ft = {
  python = {'flake8'},
  sh = {'shellcheck'},
}
local shellcheck = require('lint.linters.shellcheck')
table.insert(shellcheck.args, '-x')

require("nvim_comment").setup({
  comment_empty = false,
  create_mappings = false,
})
require("trouble").setup({
  mode = "document_diagnostics",
})
require("which-key").setup()
require('wlsample.airline')

-- symbols_outline.nvim
vim.g.symbols_outline = {
  auto_preview = false,
  width = 20,
}
