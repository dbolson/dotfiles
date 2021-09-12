local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      '__pycache__',
      "node_modules",
      "static/",
      "vendor/",
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist
      }
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
    }
  }
}
require('telescope').load_extension('fzy_native')

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

return M
