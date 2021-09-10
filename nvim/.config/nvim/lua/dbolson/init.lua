-- globals.lua
local g = vim.g

g.lsp_config = {
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
}

g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    jump_to_mark = "<c-q>",
  },
}

-- lsp-config.lua
local vim = vim
local coq = require("coq")
local lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspinstall").setup()

local function common_on_attach()
  require("lsp_signature").on_attach({})
end

local servers = require("lspinstall").installed_servers()
for _, server in pairs(servers) do
  local client = lsp[server]
  local config = vim.g.lsp_config[server] or client

  lsp[server].setup(coq.lsp_ensure_capabilities({
    on_attach = config.on_attach or common_on_attach,
    settings = config.settings or {}
  }))
end

vim.fn.sign_define(
  "LspDiagnosticsSignError",
  { text = "", numhl = "LspDiagnosticsDefaultError" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignWarning",
  { text = "", numhl = "LspDiagnosticsDefaultWarning" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignInformation",
  { text = "", numhl = "LspDiagnosticsDefaultInformation" }
)
vim.fn.sign_define(
  "LspDiagnosticsSignHint",
  { text = "", numhl = "LspDiagnosticsDefaultHint" }
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    virtual_text = { prefix = "" },
    signs = true,
    update_in_insert = false,
  }
)

-- plugins/misc.lua
require("trouble").setup()

require('nvim_comment').setup({
  comment_empty = false,
  create_mappings = false,
})

-- plugins/nvimtree.lua
g.nvim_tree_add_trailing = 1
g.nvim_tree_ignore = {'__pycache__', 'node_modules', 'vendor'}

-- plugins/lualine.lua
local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

vim.cmd("autocmd User LspProgressUpdate let &ro = &ro")

require("lualine").setup({
  options = {
    component_separators = { "", "" },
    icons_enabled = true,
    section_separators = { "", "" },
    theme = "auto",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_x = { { "diagnostics", sources = { "nvim_lsp" } }, "filename" },
    lualine_y = { "filetype", lsp_progress },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {
    "nvim-tree",
    "quickfix",
  },
})

-- plugins/telescope.lua
local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    color_devicons = true,
    file_ignore_patterns = {
      '__pycache__',
      "node_modules",
      "static/",
      "vendor/",
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    use_less = true,
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--column",
      "--line-number",
      "--no-heading",
      "--smart-case",
      "--with-filename",
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist
      },
    },
  },
  extensions = {
    fzy_native = {
      override_file_sorter = true,
      override_generic_sorter = false,
    }
  }
})
require('telescope').load_extension('fzy_native')

require('gitsigns').setup{
  signs = {
    add = {hl = 'GitSignsAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
    change = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
  }
}

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
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    python = {
      function()
        return {
          exe = "black",
          stdin = false,
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

require('lint').linters_by_ft = {
  go = {'golangcilint'},
  python = {'flake8'},
  sh = {'shellcheck'},
}

require("which-key").setup()
