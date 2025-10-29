return {
  { 'AndrewRadev/splitjoin.vim' },
  { 'andymass/vim-matchup' },
  { 'dhruvasagar/vim-zoom' },
  { 'folke/which-key.nvim' },
  {
    'j-hui/fidget.nvim',
    opts = {
      notification = {
        window = {
          avoid = { 'NvimTree' },
        },
      }
    },
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },
  { 'moll/vim-bbye' },
  { 'tpope/vim-surround' },
}
