return {
  {
    'rcarriga/nvim-dap-ui',
    config = true,
    dependencies = {
      'leoluz/nvim-dap-go',
      'mfussenegger/nvim-dap',
      'theHamsta/nvim-dap-virtual-text',
      -- 'mfussenegger/nvim-dap-python',
    },
    lazy = true,
  },
  {
    'nvim-telescope/telescope-dap.nvim',
  }
}
