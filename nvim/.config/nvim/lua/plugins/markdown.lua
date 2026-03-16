return {
  'selimacerbas/markdown-preview.nvim',
  dependencies = { 'selimacerbas/live-server.nvim' },
  config = function()
    require('markdown_preview').setup({
      port = 8421,
      open_browser = true,
      debounce_ms = 300,
    })
  end,
}
