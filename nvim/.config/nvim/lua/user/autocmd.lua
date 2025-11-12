vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  pattern = { "*" },
})

-- go formatting
vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost"}, {
  callback = function()
    vim.cmd("setlocal noexpandtab tabstop=4 shiftwidth=4")
  end,
  pattern = { "*.go" },
})

-- highlight after 120 characters
local hl_long_lines = vim.api.nvim_create_augroup("hl_long_lines", {})
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.cmd([[
    highlight OverLength ctermfg=red guibg=#592929
    match OverLength /\%120v.*/
    ]])
  end,
  group = hl_long_lines,
  pattern = { "*" },
})

local markdown = vim.api.nvim_create_augroup('markdown', {})
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  callback = function()
    vim.opt.ft = 'markdown'
    -- vim.opt_local = "spell"
    vim.opt_local = 'wrap'
  end,
  group = markdown,
  pattern = { '*.md' },
})

-- vim.api.nvim_create_autocmd({"ColorScheme", "VimEnter"}, {
--     callback = function ()
--         vim.api.nvim_set_hl(0, "MarkviewPalette0Fg", {fg = "#808080"})
--     end,
--     group = vim.api.nvim_create_augroup('Color', {}),
--     pattern = { "*.md" },
-- })

-- can we make this the same as the other part of the floating window?
-- vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg='#000000' })
