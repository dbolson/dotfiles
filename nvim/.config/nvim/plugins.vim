" bbye
nnoremap <silent> <leader>q :Bwipeout<cr>

" fugitive
nnoremap <leader>gb :Git blame<cr>
nnoremap <leader>gB :GBrowse<cr>

" nvim-comment
nnoremap <silent><leader>/ :CommentToggle<cr>
vnoremap <silent><leader>/ :CommentToggle<cr>

autocmd BufWritePost * silent! FormatWrite

" telescope
nnoremap <leader>* <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>fl <cmd>Telescope luasnip<cr>
nnoremap <leader>fs <cmd>Telescope colorscheme<cr>
nnoremap <leader>ft <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>A <cmd>Telescope telescope-alternate alternate_file<cr>
" open alternate file in vertical split
nnoremap <leader>V <c-w>v<c-w>l \| <cmd>Telescope telescope-alternate alternate_file<cr>

nnoremap <leader>fG :lua require('user.telescope').search_go_files()<cr>
nnoremap <leader>fd :lua require('user.telescope').search_documents()<cr>
nnoremap <leader>fg :lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
nnoremap <leader>fv :lua require('user.telescope').search_dotfiles()<cr>
nnoremap <leader>fw :lua require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()<cr>

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

let g:matchup_matchparen_offscreen = {'method': 'popup'}
