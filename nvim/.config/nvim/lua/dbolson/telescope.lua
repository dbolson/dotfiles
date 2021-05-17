local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
      i = {
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist
      }
    }
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

return M
