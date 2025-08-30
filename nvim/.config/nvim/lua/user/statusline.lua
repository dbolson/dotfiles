local command = "goenv version | awk '{printf \"%s\", $1}'"
local handle = io.popen(command)
local read = handle:read("*a")
local function goVersion()
    if vim.bo.filetype == "go" then
        return read
    else
        return ""
    end
end

require("lualine").setup({
    sections = {
        -- lualine_c = {
        --     {
        --         navic.get_location,
        --         cond = navic.is_available,
        --     },
        -- },
        lualine_x = {
            {
                "filename",
                path = 1,
            },
            "filetype",
            goVersion,
        },
    },
    theme = "auto",
})
