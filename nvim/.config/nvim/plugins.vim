lua require("dbolson")

" bbye
nnoremap <silent> <leader>q :Bwipeout<cr>

" symbols_outline.nvim
let g:symbols_outline = {
      \ "auto_preview": v:false
      \ }
nmap <leader>S :SymbolsOutline<cr>

" fugitive
nnoremap <leader>gb :Git blame<cr>

" nvim-lightbulb
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()

" neomake
call neomake#configure#automake('nw', 500)
let g:neomake_go_golangci_lint_args = neomake#makers#ft#go#golangci_lint().args + ['--allow-parallel-runners']

" NerdCommenter
let g:NERDSpaceDelims = 1

" telescope
nnoremap <leader>* <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft <cmd>Telescope lsp_document_symbols<cr>

" vim-test
nmap <silent> <leader>s :TestNearest<cr>
nmap <silent> <leader>t :TestFile<cr>
nmap <silent> <leader>g :TestVisit<cr>

let test#strategy = "basic"

" nvim-tree
nnoremap <leader>e :NvimTreeToggle<cr>
nnoremap <leader>E :NvimTreeFindFile<cr>

" vsnip
imap <expr> <c-j> vsnip#expandable() ? '<plug>(vsnip-expand)': '<c-j>'
smap <expr> <c-j> vsnip#expandable() ? '<plug>(vsnip-expand)': '<c-j>'

" zoom
nmap <leader>zz <plug>(zoom-toggle)

" which-key
nnoremap <leader>wk :WhichKey<space>

" nvim-compe
let g:compe = {}
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.documentation = v:true
let g:compe.enabled = v:true
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.source_timeout = 200
let g:compe.throttle_time = 80

let g:compe.source = {}
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.path = v:true
" let g:compe.source.ultisnips = v:true
let g:compe.source.vsnip = v:true
