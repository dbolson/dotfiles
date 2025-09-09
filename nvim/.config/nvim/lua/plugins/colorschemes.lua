return {
  {
    'darianmorat/gruvdark.nvim',
    config = function()
      vim.cmd([[colorscheme gruvdark]])
    end,
  },
  {
    'owickstrom/vim-colors-paramount',
  },
  { 'eddyekofo94/gruvbox-flat.nvim' },
  {
    'folke/tokyonight.nvim',
    opts = {
      colors = {
        bg = "#222325",
      },
      style = "night",
    },
  },
  { 'marko-cerovac/material.nvim' },
}
