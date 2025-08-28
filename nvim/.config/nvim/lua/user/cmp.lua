local cmp = require("cmp")
local lspkind = require("lspkind")
local ls = require("luasnip")

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

cmp.setup({
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<c-p>"] = cmp.mapping.select_prev_item(),
        ["<c-n>"] = cmp.mapping.select_next_item(),
        ["<c-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), {
            "i",
            "c",
        }),
        ["<c-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), {
            "i",
            "c",
        }),
        ["<c-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ["<cr>"] = cmp.mapping.confirm({
            select = true,
        }),
        ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif ls.expandable() then
                ls.expand()
            elseif ls.expand_or_jumpable() then
                ls.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<s-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif ls.jumpable(-1) then
                ls.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
        }),
    },
    sources = {
        {
            name = "nvim_lsp",
        },
        {
            name = "nvim_lua",
        },
        {
            name = "luasnip",
        },
        {
            name = "buffer",
        },
        {
            name = "path",
        },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
})
