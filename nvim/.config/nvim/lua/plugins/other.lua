return {
  'rgroli/other.nvim',
  config = function()
    require('other-nvim').setup({
      mappings = {
        {
          pattern = '(.*)/(.*)%.ts$',
          target = {
            {
              context = 'unit test',
              target = '%1/%2.test.ts',
            },
            {
              context = 'integration test',
              target = '%1/%2.integration.test.ts',
            },
          },
        },
        {
          context = 'implementation',
          pattern = '(.*)/(.*)%.test%.ts$',
          target = '%1/%2.ts',
        },
        {
          context = 'implementation',
          pattern = '(.*)/(.*)%.integration%.test%.ts$',
          target = '%1/%2.ts',
        },
      },
      style = {
        border = 'rounded',
      },
    })
  end,
  keys = {
    { '<leader>A', '<cmd>:OtherVSplit<cr>', desc = 'open alt file in split' },
  }
}
