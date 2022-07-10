local navic = require("nvim-navic")

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
require("lint").linters_by_ft = {python = {"flake8"}, sh = {"shellcheck"}}
local shellcheck = require("lint.linters.shellcheck")
table.insert(shellcheck.args, "-x")
require("lualine").setup({
    options = {theme = "gruvbox_dark"},
    sections = {
        lualine_c = {{navic.get_location, cond = navic.is_available}},
        lualine_x = {{"filename", path = 1}, "fileformat", "filetype"},
    },
})
require("nvim_comment").setup({comment_empty = false, create_mappings = false})
require("which-key").setup()

-- symbols_outline.nvim
vim.g.symbols_outline = {auto_preview = false, width = 20}
