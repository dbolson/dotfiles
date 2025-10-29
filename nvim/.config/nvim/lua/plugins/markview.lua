return {
  'OXY2DEV/markview.nvim',
  config = function()
    require('markview.extras.checkboxes').setup()
    -- vim.api.nvim_set_hl(0, 'MarkviewPalette1', {fg = '#FF0000'})
    local presets = require('markview.presets')
    require('markview').setup({
      markdown = {
        headings = presets.headings.numbered,
        horizontal_rules = presets.horizontal_rules.dashed,
        list_items = {
          -- shift_width = 0,
          marker_star = {
            text = "●",
          },
        },
      }
    })
  end,
  lazy = false,
  opts = {
    preview = {
        icon_provider = 'devicons',
    },
  },
}
