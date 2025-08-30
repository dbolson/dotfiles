-- core
vim.keymap.set("i", "jj", "<esc>", { noremap = true })
-- easier split navigation
vim.keymap.set("n", "<c-h>", "<c-w>h", { noremap = true })
vim.keymap.set("n", "<c-j>", "<c-w>j", { noremap = true })
vim.keymap.set("n", "<c-k>", "<c-w>k", { noremap = true })
vim.keymap.set("n", "<c-l>", "<c-w>l", { noremap = true })
-- split and move to new window
vim.keymap.set("n", "<leader>v", "<c-w>v<c-w>l", { noremap = true })
vim.keymap.set("n", "<leader>h", "<cmd>split<cr><c-w>j", { noremap = true })
-- easier go to last buffer
vim.keymap.set("n", "<leader><leader>", "<c-^>", { noremap = true })
-- copy current filename into system clipboard
vim.keymap.set("n", "<leader>cf", "<cmd>let @* = expand(\"%:~\")<cr>", { noremap = true })
vim.keymap.set("v", "<c-c>", "\"*y", { noremap = true })
-- paste last contents of what was yanked regardless of what was deleted after
vim.keymap.set("", "<leader>y", "\"*y")
vim.keymap.set("", "<leader>p", "\"*p")
-- replace smart quotes
vim.keymap.set("", "<leader>\"", ":%s/[“”]/\"/g<cr><bar>:%s/’/'/g<cr>")
-- open URL under word
vim.keymap.set("n", "<silent> gx", "!open <cword><cr>")
-- vertically expand/shrink buffer
vim.keymap.set("n", "+", "<c-w>>", { noremap = true })
-- uses '<shift> -' for consistency with '<shift> =' to mean '+'
vim.keymap.set("n", "_", "<c-w><", { noremap = true })

-- bbye
vim.keymap.set("n", "<leader>q", ":Bwipeout<cr>", {
    desc = "Bwipeout",
    noremap = true,
})

-- fugitive
vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", {
    noremap = true,
})
vim.keymap.set("n", "<leader>gB", ":GBrowse<cr>", {
    noremap = true,
})

-- lsp
vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "[e", "<cmd>lua vim.diagnostic.goto_next()<cr>")
vim.keymap.set("n", "]e", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
vim.keymap.set("n", "<leader>gR", "<cmd>lua vim.lsp.buf.rename()<cr>")
vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<cr>")
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")
vim.keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float(0, { \"single\", scope = \"line\" })<cr>")
vim.keymap.set("n", "<leader>S", ":Outline<cr>")

-- markdown
vim.keymap.set("n", "<leader>M", function()
  vim.opt.spell = true
  vim.opt.syntax = "markdown"
  vim.opt.wrap = true
end)

-- neotest
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>")
vim.keymap.set("n", "<leader>to", "<cmd>lua require('neotest').output.open()<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>")
vim.keymap.set("n", "<leader>tt", "<cmd>lua require('neotest').run.run()<cr>")

-- comment
-- vim.keymap.set({ "n", }, "<leader>x", "gcc")

-- telescope
vim.keymap.set("n", "<leader>*", "<cmd>Telescope grep_string<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>lua require('user.telescope').search_documents()<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fG", "<cmd>lua require('user.telescope').search_go_files()<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>")
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope luasnip<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope colorscheme<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_document_symbols<cr>")
vim.keymap.set("n", "<leader>fv", "<cmd>lua require('user.telescope').search_dotfiles()<cr>")
vim.keymap.set("n", "<leader>fw", "<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor()<cr>")
vim.keymap.set("n", "<leader>A", "<cmd>Telescope telescope-alternate alternate_file<cr>")
-- " open alternate file in vertical split
vim.keymap.set("n", "<leader>V", "<c-w>v<c-w>l | <cmd>Telescope telescope-alternate alternate_file<cr>")

-- nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>")

-- zoom
vim.keymap.set("n", "<leader>zz", "<plug>(zoom-toggle)<cr>")
