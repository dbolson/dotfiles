require("nvim-tree").setup({
    disable_netrw = false,
    filters = {
        custom = {nvim_tree_ignore = {".pytest_cache", "__pycache__", "node_modules", "vendor"}},
    },
    renderer = {add_trailing = true},
})
