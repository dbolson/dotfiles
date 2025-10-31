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

-- dap
vim.keymap.set("n", "<leader>dB", ":lua require('dap').set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<cr>")
vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>dc", ":lua require('dap').continue()<cr>")
vim.keymap.set("n", "<leader>dl", ":lua require('dap').run_last()<cr>")
vim.keymap.set("n", "<leader>dn", ":lua require('dap').step_over()<cr>")
vim.keymap.set("n", "<leader>dr", ":lua require('dap').repl.open()<cr>")
vim.keymap.set("n", "<leader>dsi", ":lua require('dap').step_into()<cr>")
vim.keymap.set("n", "<leader>dso", ":lua require('dap').step_out()<cr>")
vim.keymap.set("n", "<leader>dtg", ":lua require('dap-go').debug_test()<cr>")
vim.keymap.set("n", "<leader>dtp", ":lua require('dap-python').test_method()<cr>")
vim.keymap.set("n", "<leader>du", ":lua require('dapui').toggle()<cr>")

-- fugitive
vim.keymap.set("n", "<leader>gb", ":Git blame<cr>", { noremap = true })
vim.keymap.set("n", "<leader>gB", ":GBrowse<cr>", { noremap = true })

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

-- picker
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>")
vim.keymap.set("n", "<leader>fc", "<cmd>Pick git_commits<cr>")
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep_live<cr>")
-- vim.keymap.set("n", "<leader>fl", "<cmd>Telescope luasnip<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>Pick colorschemes<cr>")
-- vim.keymap.set("n", "<leader>fv", "<cmd>lua require('user.finder').search_dotfiles()<cr>")
-- vim.keymap.set("n", "<leader>A", "<cmd>Telescope telescope-alternate alternate_file<cr>")
-- " open alternate file in vertical split
-- vim.keymap.set("n", "<leader>V", "<c-w>v<c-w>l | <cmd>Telescope telescope-alternate alternate_file<cr>")

-- nvim-tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>E", "<cmd>NvimTreeFindFile<cr>")

-- zoom
vim.keymap.set("n", "<leader>zz", "<plug>(zoom-toggle)<cr>")
