local ls = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
    paths = {
        "./lua/user/snippets",
    },
})

local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node
ls.add_snippets("go", {
    s({
        trig = "dump",
        name = "spew.Dump()",
        dscr = "Snippet for spew.Dump()",
    }, {
        t("spew.Dump("),
        i(1, ""),
        t(")"),
    }),
    s({
        trig = "trun",
        name = "t.Run()",
        dscr = "Snippet for t.Run()",
        docstring = "Snippet for t.Run()",
    }, {
        t("t.Run(\""),
        i(1),
        t("\", func(t *testing.T) {"),
        i(2),
        t("})"),
    }),
})
