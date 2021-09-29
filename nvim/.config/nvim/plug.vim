let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')


Plug 'AndrewRadev/splitjoin.vim'
Plug 'Olical/conjure', {'tag': 'v4.22.1'}
Plug 'creativenull/diagnosticls-nvim'
Plug 'dhruvasagar/vim-zoom'
Plug 'ellisonleao/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
Plug 'folke/trouble.nvim'
Plug 'folke/which-key.nvim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'glepnir/lspsaga.nvim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'mhartington/formatter.nvim'
Plug 'moll/vim-bbye'
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim' " telescope.lua
Plug 'nvim-lua/popup.nvim' " telescope.lua
Plug 'nvim-telescope/telescope-fzy-native.nvim' " telescope.lua
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ray-x/lsp_signature.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'terrortylor/nvim-comment'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tweekmonster/startuptime.vim'
Plug 'windwp/windline.nvim'

" colors
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'rktjmp/lush.nvim'
Plug 'romgrk/doom-one.vim'

call plug#end()
