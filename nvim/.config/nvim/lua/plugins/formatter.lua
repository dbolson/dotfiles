require('formatter').setup({
  filetype = {
    go = {
      function()
        return {
          exe = 'gofmt',
          stdin = true,
        }
      end
    },
    javascript = {
      function()
        return {
          exe = "prettier",
          args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
          stdin = true
        }
      end
    },
    python = {
      function()
        return {
          exe = "black",
          args = { "-q", "-" },
          stdin = true,
        }
      end,
    },
    sh = {
      function()
        return {
          exe = "shfmt",
          args = { "-i", 2 },
          stdin = true,
        }
      end,
    },
  }
})
