let mapleader = ","
colorscheme vividchalk

set autowrite " Automatically :write before running commands
set cmdheight=2 " Give more space for displaying messages.
set cursorline
set expandtab " always uses spaces instead of tab characters
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
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show the signcolumn, otherwise it would shift the diagnostics.
set smartcase
set softtabstop=2
set tabstop=2
set termguicolors
set updatetime=300
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildmode=list:longest,list:full

" Highlight after 120 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
  autocmd BufEnter * match OverLength /\%120v.*/
augroup END
autocmd! BufWritePost * Neomake

" Copy current filename into system clipboard
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>
vnoremap <C-C> "*y

" Paste last contents of what was yanked regardless of what was deleted after
map <leader>y "*y
map <leader>p "*p

" split and move to new window
nnoremap <leader>v <C-W>v<C-W>l
nnoremap <leader>h :split<CR><C-W>j

map <leader>nt :NERDTreeToggle<CR>
let g:NERDTreeIgnore=['^node_modules$', '^__pycache__$', '\.pyc$', '\.rbc$', '\~$']
map <leader>o :NERDTreeFind<CR>
let g:NERDTreeGitStatusWithFlags = 1

map <C-P> :FZF<CR>
map <C-T> :Tags<CR>
map <C-B> :Buffers<CR>
nnoremap <leader>ag :Grepper -tool ag -jump<cr>
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>

nnoremap <silent> <leader>q :Bwipeout<CR>

imap jj <Esc>

" CTags
set tags=./.tags-dep,.tags-dep,./.tags,.tags
map <leader>rt :!ctags -R --exclude=node_modules -f .tags . <CR>

" Add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap
let g:markdown_fenced_languages = ['bash=sh', 'go', 'html', 'javascript', 'python', 'ruby', 'scala', 'vim']
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

"let test#neovim#term_position = "vertical"
let test#strategy = "basic"
" launchdarkly-specific
let test#go#gotest#executable = 'GONFALON_MODE=test go test'
" ctrl-o to enter normal mode in test window
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

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

" let g:gitgutter_signs = 0

" ListToggle plugin
let g:lt_location_list_toggle_map = '<leader>u'
let g:lt_quickfix_list_toggle_map = '<leader>l'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <leader>zz <Plug>(zoom-toggle)

let g:coc_global_extensions = [
      \'coc-go',
      \'coc-json',
      \'coc-prettier',
      \'coc-tslint-plugin',
      \'coc-tsserver',
      \]

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
