" bbye
nnoremap <silent> <leader>q :Bwipeout<cr>

" fugitive
nnoremap <leader>gb :Git blame<cr>

" nvim-comment
nnoremap <silent><leader>/ :CommentToggle<cr>
vnoremap <silent><leader>/ :CommentToggle<cr>

autocmd BufWritePost * silent! FormatWrite

" telescope
nnoremap <leader>* <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>fl <cmd>Telescope luasnip<cr>
nnoremap <leader>fs <cmd>Telescope colorscheme<cr>
nnoremap <leader>ft <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>V <c-w>v<c-w>l \| <cmd>Telescope telescope-alternate alternate_file<cr>

" vim-test
nmap <silent> <leader>s :TestNearest<cr>
nmap <silent> <leader>t :TestFile<cr>
nmap <silent> <leader>g :TestVisit<cr>
let test#strategy = "basic"

" nvim-tree
nnoremap <leader>e :NvimTreeToggle<cr>
nnoremap <leader>E :NvimTreeFindFile<cr>

" wilder-nvim
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))

" zoom
nmap <leader>zz <plug>(zoom-toggle)

" nvim-lint
au BufEnter * lua require('lint').try_lint()
au BufWritePost * lua require('lint').try_lint()
