-- require("nvim-web-devicons").setup()

local navic = require("nvim-navic")

-- require("glow").setup()

-- require("gitsigns").setup({
--     signs = {
--         add = {
--             text = "+",
--         },
--         change = {
--             text = "│",
--         },
--         delete = {
--             text = "_",
--         },
--     },
-- })

-- local command = "goenv version | awk '{printf \"%s\", $1}'"
-- local handle = io.popen(command)
-- local read = handle:read("*a")
-- local function goVersion()
--     if vim.bo.filetype == "go" then
--         return read
--     else
--         return ""
--     end
-- end

-- require("lualine").setup({
--     sections = {
--         lualine_c = {
--             {
--                 navic.get_location,
--                 cond = navic.is_available,
--             },
--         },
--         lualine_x = {
--             {
--                 "filename",
--                 path = 1,
--             },
--             "filetype",
--             goVersion,
--         },
--     },
--     theme = "auto",
-- })

-- require("nvim_comment").setup({
--     comment_empty = false,
--     create_mappings = false,
-- })
--
-- require("which-key").setup()

require("outline").setup({})
