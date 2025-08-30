return {
  {
    'owickstrom/vim-colors-paramount',
    config = function()
      vim.cmd([[colorscheme paramount]])
    end,
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
