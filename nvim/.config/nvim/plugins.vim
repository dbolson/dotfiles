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
autocmd VimEnter * silent! WindLineFloatToggle

" lspsaga.nvim
nnoremap <silent><c-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>
nnoremap <silent><c-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<cr>
nnoremap <silent>E <cmd>lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false,border='rounded'})<cr>
nnoremap <silent>K <cmd>lua vim.lsp.buf.hover()<cr>
nnoremap <silent>[e <cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_prev()<cr>
nnoremap <silent>]e <cmd>lua require('lspsaga.diagnostic').lsp_jump_diagnostic_next()<cr>
nnoremap <silent>gD <cmd>lua require'lspsaga.provider'.preview_definition()<cr>
nnoremap <silent>gd <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <silent>gh <cmd>lua require'lspsaga.provider'.lsp_finder()<cr>
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<cr>
nnoremap <silent>gu <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <silent><leader>so :SymbolsOutline<cr>
nnoremap <silent><leader>xx :TroubleToggle<cr>

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
