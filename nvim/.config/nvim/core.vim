let mapleader=","

let gruvbox_flat_style = "dark"
let material_style = 'deep ocean'
let neon_style="dark"
let g:tokyonight_style = "night"
let g:tokyonight_colors = {
      \ "bg": "#222325"
      \ }
colorscheme paramount

set autowrite " automatically :write before running commands
set cmdheight=2 " give more space for displaying messages.
set completeopt=menuone,noselect
set cursorline " highlight current line
set expandtab " always uses spaces instead of tab characters
set ignorecase
set list listchars=tab:\ \ ,trail:·
set mouse=a " can click around in terminal window
set nobackup
set nohlsearch
set noincsearch
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

" use filetype.lua instead of filetype.vim
let g:do_filetype_lua = 1
let g:did_load_filetypes = 0

inoremap jj <esc>

" highlight after 120 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
  autocmd BufEnter * match OverLength /\%120v.*/
augroup END

" easier split navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" easier go to last buffer
nnoremap <leader><leader> <c-^>

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
let g:markdown_fenced_languages = ['bash=sh', 'go', 'html', 'java', 'javascript', 'python', 'ruby', 'scala', 'vim']
map <leader>M :set syntax=markdown<cr>:set wrap<cr>:set spell<cr>

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

map <leader>" :%s/[“”]/"/g<cr><bar>:%s/’/'/g<cr>
nmap <silent> gx :!open <cWORD><cr>

nnoremap + <c-w>>
" uses '<shift> -' for consistency with '<shift> =' to mean '+'
nnoremap _ <c-w><

" tab fills in selected autocomplete
inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<cr>"
