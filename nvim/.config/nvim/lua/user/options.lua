-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.have_nerd_font = true
vim.g.markdown_fenced_languages = {
  "bash=sh",
  "go",
  "html",
  "java",
  "javascript",
  "python",
  "ruby",
  "vim",
}

-- vim.cmd.colorscheme("paramount")

vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.cmdheight = 2
-- vim.opt.completeopt = "menuone,noselect"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = false
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.wb = false
vim.opt.wildmode = "list:longest,list:full"
vim.opt.winborder = "rounded"
vim.opt.wrap = false

-- vim.opt.shortmess = vim.opt.shortmess + "c" -- don't give |ins-completion-menu| messages.
-- let g:do_filetype_lua = 1
-- let g:did_load_filetypes = 0
