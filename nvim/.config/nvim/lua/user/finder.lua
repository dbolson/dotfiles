local center_window = function()
  local height = math.floor(0.618 * vim.o.lines)
  local width = math.floor(0.618 * vim.o.columns)
  return {
    anchor = 'NW', height = height, width = width,
    row = math.floor(0.5 * (vim.o.lines - height)),
    col = math.floor(0.5 * (vim.o.columns - width)),
  }
end

require('mini.pick').setup({
  mappings = {
    toggle_preview = '<C-k>',
  },
  window = {
    config = center_window,
  }
})
require('mini.extra').setup()

-- TODO: ignore case for grep_live
-- TODO: make sure these are ignored:
--       "__pycache__",
--       "node_modules",
--       "vendor/",
--       ".class",
-- TODO: open alternative file like telescope-alternate
-- TODO: search dotfiles in "$HOME/dotfiles/nvim/.config/nvim"
-- TODO: pick luasnip snippets
