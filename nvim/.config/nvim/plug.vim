let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'dhruvasagar/vim-zoom'
Plug 'ellisonleao/glow.nvim'
Plug 'folke/which-key.nvim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
Plug 'moll/vim-bbye'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'terrortylor/nvim-comment'
Plug 'tpope/vim-surround'

" completion
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
Plug 'saadparwaiz1/cmp_luasnip'

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'benfowler/telescope-luasnip.nvim'
Plug 'rafamadriz/friendly-snippets'

" statusline
Plug 'SmiteshP/nvim-navic'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
Plug 'nvim-lualine/lualine.nvim'

" debugging
Plug 'leoluz/nvim-dap-go'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" lsp
Plug 'Olical/conjure', {'tag': 'v4.45.0'}
Plug 'folke/trouble.nvim'
Plug 'mfussenegger/nvim-jdtls'
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'wlangstroth/vim-racket'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'otavioschwanck/telescope-alternate.nvim'

" themes
Plug 'cranberry-clockworks/coal.nvim'
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'rktjmp/lush.nvim'
Plug 'romgrk/doom-one.vim'

call plug#end()

set runtimepath+=/opt/homebrew/Cellar/lilypond/2.22.2_1/share/lilypond/2.22.2/vim/
