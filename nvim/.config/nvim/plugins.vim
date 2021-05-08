lua << EOF
vim.g.symbols_outline = {
    auto_preview = false
}
EOF
nmap <leader>S :SymbolsOutline<cr>

" zoom
nmap <leader>zz <plug>(zoom-toggle)

" fugitive
nnoremap <leader>gb :Git blame<cr>

" bbye
nnoremap <silent> <leader>q :Bwipeout<cr>

" NerdCommenter
let g:NERDSpaceDelims = 1

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fF <cmd>Telescope file_browser<cr>
nnoremap <leader>ft <cmd>Telescope tags<cr> " TODO: will this work with vista?
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>* <cmd>Telescope grep_string<cr>

" nvim-tree
nnoremap <leader>e :NvimTreeToggle<cr>
" nnoremap <leader>n :NvimTreeFindFile<cr> TODO: make this something

" vim-test
nmap <silent> <leader>s :TestNearest<cr>
nmap <silent> <leader>t :TestFile<cr>
nmap <silent> <leader>g :TestVisit<cr>

let test#strategy = "basic"

" vsnip
imap <expr> <c-j> vsnip#expandable() ? '<plug>(vsnip-expand)': '<c-j>'
smap <expr> <c-j> vsnip#expandable() ? '<plug>(vsnip-expand)': '<c-j>'

" neomake
call neomake#configure#automake('nw', 500)

" lsp-trouble
lua << EOF
  require("trouble").setup{}
  vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>LspTroubleToggle<cr>",
    {silent = true, noremap = true}
  )
EOF

lua << EOF
require('lualine').setup{ theme = 'onedark' }
require('lspinstall').setup()

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }
  -- map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts) -- TODO: make this automatic
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts) -- TODO: show up in window
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts) -- TODO: remove?
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts) -- TODO: remove?
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts) -- TODO: do this automatically
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{
    capabilities = capabilities,
    on_attach = on_attach
  }
end

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "__pycache__",
      "vendor/"
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    }
  }
}
EOF

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
