let mapleader = ","
colorscheme vividchalk

set autowrite " Automatically :write before running commands
set cursorline
set expandtab
set hidden
set ignorecase
set list listchars=tab:\ \ ,trail:·
set nobackup
set nohlsearch
set noswapfile
set nowb
set nowrap
set number
set scrolloff=10
set shiftwidth=2
set shortmess+=I
set smartcase
set softtabstop=2
set tabstop=2
set termguicolors
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildmode=list:longest,list:full

" Highlight after 100 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
  autocmd BufEnter * match OverLength /\%80v.*/
augroup END
autocmd! BufWritePost * Neomake

" Copy current filename into system clipboard
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>
vnoremap <C-C> "*y

" Paste last contents of what was yanked regardless of what was deleted after
"nnoremap <leader>p "0p
"nnoremap <leader>P "0P
map <leader>y "*y
map <leader>p "*p

" split and move to new window
nnoremap <leader>v <C-W>v<C-W>l
nnoremap <leader>h :split<CR><C-W>j

map <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['^__pycache__$', '\.pyc$', '\.rbc$', '\~$']
map <leader>o :NERDTreeFind<CR>

map <C-P> :FZF<CR>
map <C-T> :Tags<CR>
map <C-B> :Buffers<CR>
nnoremap <leader>ag :Ag<space>

nnoremap <silent> <leader>q :BD<CR>

imap jj <Esc>

" CTags
set tags=./.tags-dep,.tags-dep,./.tags,.tags
map <leader>rt :!ctags -R -f .tags . <CR>

" Add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap
let g:markdown_fenced_languages = ['bash=sh', 'html', 'javascript', 'python', 'ruby', 'scala', 'vim']
map <leader>M :set syntax=markdown<CR>:set wrap<CR>:set spell<CR>

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" split-term
set splitright
set splitbelow

" Testing
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>g :TestVisit<CR>

let test#strategy = "neovim"

" JSON
map <leader>fj :%!python -m json.tool<CR>

" SQL
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"

" Change smart quotes
map <leader>" :%s/[“”]/"/g<CR><BAR>:%s/’/'/g<CR>

" Remove trailing whitespace when manually saving a buffer
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

set rtp+=/usr/local/opt/fzf

" Greplace
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

 let g:gitgutter_signs = 0
