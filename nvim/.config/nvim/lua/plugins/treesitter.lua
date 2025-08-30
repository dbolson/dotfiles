return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
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
