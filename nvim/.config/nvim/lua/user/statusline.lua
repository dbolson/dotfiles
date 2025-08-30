local function showGoVersion()
  local command = "goenv version | awk '{printf \"%s\", $1}'"
  local handle = io.popen(command)
  if not handle then
    return ""
  end
  local read = handle:read("*a")

  if vim.bo.filetype == "go" then
    return read
  else
    return ""
  end
end

require("lualine").setup({
  sections = {
    lualine_x = {
      {
        "filename",
        path = 1,
      },
      "filetype",
      showGoVersion,
    },
  },
  theme = "auto",
})
