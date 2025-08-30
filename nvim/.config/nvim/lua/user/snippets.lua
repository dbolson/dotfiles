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
ls.add_snippets("markdown", {
    s({
        trig = "fence",
        name = "code fencing",
        docstring = "Snippet for code fencing",
    }, {
        t("```"),
        t({
            "",
            "",
        }),
        i(1, ""),
        t({
            "",
            "```",
        }),
    }),
})
ls.add_snippets("go", {
    s({
        trig = "prn",
        name = "println",
        docstring = "Snippet for debugging",
    }, {
        t("fmt.Println(\">>> "),
        i(1, ""),
        t("\")"),
    }),
    s({
        trig = "prndb",
        name = "debug",
        docstring = "Snippet for debugging",
    }, {
        t("fmt.Println(\">>> "),
        i(1, ""),
        t("\")"),
        t({
            "",
            "spew.Dump(",
        }),
        i(2, ""),
        t(")"),
    }),
    s({
        trig = "dump",
        name = "spew.Dump()",
        docstring = "Snippet for spew.Dump()",
    }, {
        t("spew.Dump("),
        i(1, ""),
        t(")"),
    }),
    s({
        trig = "trun",
        name = "t.Run()",
        docstring = "Snippet for t.Run()",
    }, {
        t("t.Run(\""),
        i(1),
        t("\", func(t *testing.T) {"),
        i(2),
        t("})"),
    }),
    s({
        trig = "tt",
        name = "table test",
        docstring = "Snippet for table test",
    }, {
        t("func Test"),
        i(1),
        t("(t *testing.T) {"),
        t({
            "",
            "\ttests := map[string]struct {",
        }),
        t({
            "",
            "\t}{",
        }),
        t({
            "",
            "\t\t\"",
        }),
        i(2),
        t("\": {"),
        t({
            "",
            "\t\t},",
        }),
        t({
            "",
            "\t}",
        }),
        t({
            "",
            "\tfor name, tt := range tests {",
        }),
        t({
            "",
            "\t\tt.Run(name, func(t *testing.T) {",
        }),
        t({
            "",
            "\t\t\t",
        }),
        i(0),
        t({
            "",
            "\t\t})",
        }),
        t({
            "",
            "\t}",
        }),
        t({
            "",
            "}",
        }),
    }),
})
