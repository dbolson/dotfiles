call plug#begin('~/.local/share/nvim/plugged')

Plug 'SirVer/ultisnips'
Plug 'Valloric/ListToggle'
Plug 'airblade/vim-gitgutter'
Plug 'b4b4r07/vim-sqlfmt'
Plug 'dhruvasagar/vim-zoom'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hecal3/vim-leader-guide'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'markstory/vim-zoomwin'
Plug 'mhinz/vim-grepper'
Plug 'moll/vim-bbye'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

" coc plugins
Plug 'fannheyward/coc-pyright', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}

call plug#end()
