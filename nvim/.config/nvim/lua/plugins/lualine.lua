local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

vim.cmd("autocmd User LspProgressUpdate let &ro = &ro")

require("lualine").setup({
  options = {
    component_separators = { "", "" },
    icons_enabled = true,
    section_separators = { "", "" },
    theme = "auto",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_x = { { "diagnostics", sources = { "nvim_lsp" } }, "filename" },
    lualine_y = { "filetype", lsp_progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    "nvim-tree",
    "quickfix",
  },
})
