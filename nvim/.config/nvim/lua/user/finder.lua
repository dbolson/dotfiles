local telescope = require("telescope")
local actions = require("telescope.actions")
telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "__pycache__",
      "node_modules",
      "vendor/",
      ".class",
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--column",
      "--line-number",
      "--no-heading",
      "--smart-case",
      "--with-filename",
    },
  },
  extensions = {
    fzy_native = {
      override_file_sorter = true,
      override_generic_sorter = false,
    },
    ["telescope-alternate"] = {
      mappings = {
        -- go
        {
          "(.*).go",
          {
            {
              "[1]_test.go",
              "Test",
              true,
            },
          },
        },
        {
          "(.*)_test.go",
          {
            {
              "[1].go",
              "Alternate",
              true,
            },
          },
        },
        -- python
        {
          "(.*).py",
          {
            {
              "test_[1].py",
              "Test",
              true,
            },
          },
        },
      },
    },
  },
}
telescope.load_extension("dap")
telescope.load_extension("fzy_native")
telescope.load_extension("live_grep_args")
telescope.load_extension("luasnip")
telescope.load_extension("telescope-alternate")

local M = {}
M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "<vimrc>",
    cwd = "$HOME/dotfiles/nvim/.config/nvim",
  })
end

M.search_documents = function()
  require("telescope.builtin").find_files({
    prompt_title = "<documents>",
    cwd = "$HOME/Documents",
  })
end

M.search_go_files = function()
  require("telescope.builtin").live_grep {
    additional_args = function()
      return {
        "-g*.go",
      }
    end,
    prompt_title = "Live Grep (*.go)",
  }
end

return M
