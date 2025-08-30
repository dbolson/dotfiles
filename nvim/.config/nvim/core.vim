let mapleader=","

let gruvbox_flat_style = "dark"
let material_style = 'deep ocean'
let neon_style="dark"
"let g:tokyonight_style = "night"
"let g:tokyonight_colors = {
"      \ "bg": "#222325"
"      \ }
"colorscheme paramount

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
" split-term
set splitright
set splitbelow

" use filetype.lua instead of filetype.vim
"let g:do_filetype_lua = 1
"let g:did_load_filetypes = 0

" highlight after 120 characters
"augroup vimrc_autocmds
"  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
"  autocmd BufEnter * match OverLength /\%120v.*/
"augroup END

" add markdown syntax highlighting and spellcheck
"au BufRead,BufNewFile *.md set ft=markdown
"au BufRead,BufNewFile *.md setlocal spell
"au BufRead,BufNewFile *.md setlocal wrap
"let g:markdown_fenced_languages = ['bash=sh', 'go', 'html', 'java', 'javascript', 'python', 'ruby', 'scala', 'vim']
"map <leader>M :set syntax=markdown<cr>:set wrap<cr>:set spell<cr>

"au TextYankPost * lua vim.hl.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" tab fills in selected autocomplete
" inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<cr>"
