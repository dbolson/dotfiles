return {
  {
    'saghen/blink.cmp',
    opts = {
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
        },
        menu = {
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind",              gap = 1 },
            },
          },
        },
      },
      keymap = {
        preset = 'default',
        -- ['<cr>'] = { 'select_and_accept' },
      },
      signature = {
        enabled = true,
        window = {
          show_documentation = false,
        },
      },
      snippets = {
        preset = 'luasnip',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "lua" },
    },
    opts_extend = { "sources.default" },
    version = '1.*',
  },
  {
    'L3MON4D3/LuaSnip',
    build = "make install_jsregexp",
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = "v2.*",
  },
}
