" bbye
nnoremap <silent> <leader>q :Bwipeout<cr>

" symbols_outline.nvim
let g:symbols_outline = {
      \ "auto_preview": v:false
      \ }
nmap <leader>S :SymbolsOutline<cr>

" fugitive
nnoremap <leader>gb :Git blame<cr>

" nvim-comment
nnoremap <silent><leader>/ :CommentToggle<cr>
vnoremap <silent><leader>/ :CommentToggle<cr>

autocmd BufWritePost * silent! FormatWrite

" lspsaga.nvim
" TODO: update shortcuts
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>xx :TroubleToggle<CR>
nnoremap <silent><leader>so :SymbolsOutline<CR>

" telescope
nnoremap <leader>* <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope colorscheme<cr>
nnoremap <leader>ft <cmd>Telescope lsp_document_symbols<cr>

" vim-test
nmap <silent> <leader>s :TestNearest<cr>
nmap <silent> <leader>t :TestFile<cr>
nmap <silent> <leader>g :TestVisit<cr>
let test#strategy = "basic"

" alternate
command! -bang Alt lua require("alternate").switch("<bang>"=="!", '')
command! -bang AltV lua require("alternate").switch("<bang>"=="!", 'vsplit')
command! -bang AltS lua require("alternate").switch("<bang>"=="!", 'split')

nnoremap <leader>V :AltV<cr>

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
