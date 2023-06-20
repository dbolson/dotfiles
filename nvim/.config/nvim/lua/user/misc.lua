local navic = require("nvim-navic")

require("glow").setup()

require("gitsigns").setup({
    signs = {
        add = {
            hl = "GitSignsAdd",
            text = "+",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
        },
        change = {
            hl = "GitSignsChange",
            text = "│",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
        },
        delete = {
            hl = "GitSignsDelete",
            text = "_",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
        },
    },
})
require("lualine").setup({
    sections = {
        lualine_c = {
            {
                navic.get_location,
                cond = navic.is_available,
            },
        },
        lualine_x = {
            {
                "filename",
                path = 1,
            },
            "fileformat",
            "filetype",
        },
    },
})
require("nvim_comment").setup({
    comment_empty = false,
    create_mappings = false,
})
require("which-key").setup()

require("symbols-outline").setup({
    width = 20,
})
