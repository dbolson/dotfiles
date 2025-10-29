return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    lazy = false,
    opts = {
      ensure_installed = {
        'c',
        'eex',
        'elixir',
        'erlang',
        'go',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'typescript',
      },
    },
    -- tag = 'v0.10.0',
  },
}
