local g = vim.g

-- these go before setup()
g.nvim_tree_add_trailing = 1

require('nvim-tree').setup({
  disable_netrw = false,
  filters = {
    custom = {
      nvim_tree_ignore = {
        '.pytest_cache',
        '__pycache__',
        'node_modules',
        'vendor',
      },
    },
  },
})
