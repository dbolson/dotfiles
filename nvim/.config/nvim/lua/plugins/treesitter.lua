return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		opts = {
			install = {
				"eex",
				"elixir",
				"erlang",
				"go",
				"html",
				"javascript",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"typescript",
				"yaml",
			},
		},
		-- tag = 'v0.10.0',
	},
}
