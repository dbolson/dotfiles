call plug#begin('~/.local/share/nvim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " => neovim-ghcmod
Plug 'Valloric/ListToggle'
Plug 'airblade/vim-gitgutter'
Plug 'ambv/black'
Plug 'b4b4r07/vim-sqlfmt'
Plug 'bling/vim-bufferline'
Plug 'buoto/gotests-vim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'derekwyatt/vim-scala'
Plug 'ekalinin/Dockerfile.vim'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'fisadev/vim-isort'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'neomake/neomake'
Plug 'neovimhaskell/neovim-ghcmod' " haskell
Plug 'pangloss/vim-javascript'
Plug 'qpkorr/vim-bufkill'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sebdah/vim-delve'
Plug 'skwp/greplace.vim'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'vimlab/split-term.vim'
Plug 'zchee/deoplete-jedi'

let g:deoplete#enable_at_startup = 1

call plug#end()
