require("user.lsp.handlers").setup()

require("fidget").setup()
require("lsp_signature").setup({
    floating_window = false,
    hint_prefix = "", -- no panda
})
require("trouble").setup({})
