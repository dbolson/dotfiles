-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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
-- vim.g.have_nerd_font = true

vim.opt.autowrite = true
vim.opt.backup = false
vim.opt.cmdheight = 2
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
-- vim.opt.shortmess = vim.opt.shortmess + "c" -- don't give |ins-completion-menu| messages.
