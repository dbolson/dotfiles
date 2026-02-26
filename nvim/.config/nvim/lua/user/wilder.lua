local wilder = require("wilder")
wilder.setup({
  modes = {
    ":",
    "/",
    "?",
  },
})
wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_palette_theme({
    border = 'single',
    left = {' ', wilder.popupmenu_devicons()},
    max_height = '50%',
    min_height = 0,
    prompt_position = 'top',
    reverse = 0,
  })
))
