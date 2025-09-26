return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    opts = {
      ensure_installed = {
        "c",
        "go",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "typescript",
      },
    },
  },
}
