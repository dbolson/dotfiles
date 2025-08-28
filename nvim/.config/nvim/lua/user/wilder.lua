local wilder = require("wilder")
wilder.setup({
    modes = {
        ":",
        "/",
        "?",
    },
})
wilder.set_option("renderer", wilder.popupmenu_renderer({
    highlighter = wilder.basic_highlighter(),
}))
