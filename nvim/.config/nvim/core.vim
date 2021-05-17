let mapleader=","

let neon_style="dark"
colorscheme neon

set autowrite " automatically :write before running commands
set cmdheight=2 " give more space for displaying messages.
set completeopt=menuone,noselect
set cursorline " highlight current line
set expandtab " always uses spaces instead of tab characters
set hidden
set ignorecase
set list listchars=tab:\ \ ,trail:·
set mouse=a " can click around in terminal window
set nobackup
set nohlsearch
set noswapfile
set nowb
set nowrap
set number
set scrolloff=10
set shiftwidth=2
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show the signcolumn, otherwise it would shift the diagnostics.
set smartcase
set softtabstop=2
set tabstop=2
set termguicolors
set updatetime=300
set wildmode=list:longest,list:full

inoremap jj <esc>

" highlight after 120 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
  autocmd BufEnter * match OverLength /\%120v.*/

  autocmd BufWritePost * silent! Neoformat
  autocmd BufWritePost * silent! Neomake
augroup END

" easier split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" split-term
set splitright
set splitbelow

" split and move to new window
nnoremap <leader>v <c-w>v<c-w>l
nnoremap <leader>h :split<cr><c-w>j

" copy current filename into system clipboard
nnoremap <silent> <leader>cf :let @* = expand("%:~")<cr>
vnoremap <c-c> "*y

" paste last contents of what was yanked regardless of what was deleted after
map <leader>y "*y
map <leader>p "*p

" add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap
let g:markdown_fenced_languages = ['bash=sh', 'go', 'html', 'javascript', 'python', 'ruby', 'scala', 'vim']
map <leader>M :set syntax=markdown<cr>:set wrap<cr>:set spell<cr>

map <leader>" :%s/[“”]/"/g<cr><bar>:%s/’/'/g<cr>

nnoremap <leader>+ <c-w>>
nnoremap <leader>- <c-w><

nnoremap <leader>vrc :lua require('dbolson.telescope').search_dotfiles()<cr>
