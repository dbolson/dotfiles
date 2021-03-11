let mapleader = ","
colorscheme vividchalk

set autowrite " Automatically :write before running commands
set cmdheight=2 " Give more space for displaying messages.
set cursorline
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
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildmode=list:longest,list:full

" Highlight after 120 characters
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
  autocmd BufEnter * match OverLength /\%120v.*/
augroup END
autocmd! BufWritePost * Neomake

" Copy current filename into system clipboard
nnoremap <silent> <leader>cf :let @* = expand("%:~")<cr>
vnoremap <c-c> "*y

" Paste last contents of what was yanked regardless of what was deleted after
map <leader>y "*y
map <leader>p "*p

" split and move to new window
nnoremap <leader>v <c-w>v<c-w>l
nnoremap <leader>h :split<cr><c-w>j

set rtp+=/usr/local/opt/fzf
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*" --glob "!node_modules/*" --glob "!vendor/*"'

nnoremap <leader>rg :Grepper -tool rg -jump<cr>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <silent> <leader>fb :Buffers<cr>
nnoremap <silent> <leader>ff :FZF<cr>
nnoremap <silent> <leader>fg :Rg<cr>
nnoremap <silent> <leader>ft :Tags<cr>

nnoremap <silent> <leader>q :Bwipeout<cr>

imap jj <esc>

" NerdCommenter
let g:NERDSpaceDelims = 1

" CTags
set tags=./.tags-dep,.tags-dep,./.tags,.tags
map <leader>rt :!ctags -R --exclude=node_modules -f .tags . <cr>

" Add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap
let g:markdown_fenced_languages = ['bash=sh', 'go', 'html', 'javascript', 'python', 'ruby', 'scala', 'vim']
map <leader>M :set syntax=markdown<cr>:set wrap<cr>:set spell<cr>

" Easier split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" split-term
set splitright
set splitbelow

" coc-explorer
nnoremap <leader>e :CocCommand explorer<cr>

" Testing
nmap <silent> <leader>s :TestNearest<cr>
nmap <silent> <leader>t :TestFile<cr>
nmap <silent> <leader>g :TestVisit<cr>

let test#strategy = "basic"
" launchdarkly-specific
let test#go#gotest#executable = 'GONFALON_MODE=test go test'
" ctrl-o to enter normal mode in test window
if has('nvim')
  tmap <c-o> <c-\><c-n>
endif

" JSON
map <leader>fj :%!python -m json.tool<cr>

" SQL
let g:sqlfmt_command = "sqlformat"
let g:sqlfmt_options = "-r -k upper"

" Change smart quotes
map <leader>" :%s/[“”]/"/g<cr><bar>:%s/’/'/g<cr>

" Remove trailing whitespace when manually saving a buffer
fun! <sid>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <sid>StripTrailingWhitespaces()

" ListToggle plugin
let g:lt_location_list_toggle_map = '<leader>u'
let g:lt_quickfix_list_toggle_map = '<leader>l'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <leader>zz <plug>(zoom-toggle)

" fugitive
nnoremap <leader>gb :Git blame<cr>

" use <c-space> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <c-Space>
      \ pumvisible() ? "\<c-n>" :
      \ <SID>check_back_space() ? "\<c-space>" :
      \ coc#refresh()

" Use <cr> to confirm completion, `<c-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<c-y>" : "\<c-g>u\<cr>"

" Remap keys for gotos
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <leader>tl :Vista coc<cr>
let g:vista_default_executive='coc'
let g:vista#renderer#enable_icon=0
