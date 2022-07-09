require("lsp.lsp-installer")
require("lsp.handlers").setup()

require("lsp_signature").setup({
    floating_window = false,
    hint_prefix = "", -- no panda
})
require("lspsaga").setup({code_action_icon = ""})
