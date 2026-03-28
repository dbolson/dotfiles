-- ┌─────────────────────────┐
-- │ Plugins outside of MINI │
-- └─────────────────────────┘
--
-- This file contains installation and configuration of plugins outside of MINI.
-- They significantly improve user experience in a way not yet possible with MINI.
-- These are mostly plugins that provide programming language specific behavior.
--
-- Use this file to install and configure other such plugins.

-- Make concise helpers for installing/adding plugins in two stages
local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

-- Tree-sitter ================================================================

-- Tree-sitter is a tool for fast incremental parsing. It converts text into
-- a hierarchical structure (called tree) that can be used to implement advanced
-- and/or more precise actions: syntax highlighting, textobjects, indent, etc.
--
-- Tree-sitter support is built into Neovim (see `:h treesitter`). However, it
-- requires two extra pieces that don't come with Neovim directly:
-- - Language parsers: programs that convert text into trees. Some are built-in
--   (like for Lua), 'nvim-treesitter' provides many others.
--   NOTE: It requires third party software to build and install parsers.
--   See the link for more info in "Requirements" section of the MiniMax README.
-- - Query files: definitions of how to extract information from trees in
--   a useful manner (see `:h treesitter-query`). 'nvim-treesitter' also provides
--   these, while 'nvim-treesitter-textobjects' provides the ones for Neovim
--   textobjects (see `:h text-objects`, `:h MiniAi.gen_spec.treesitter()`).
--
-- Add these plugins now if file (and not 'mini.starter') is shown after startup.
--
-- Troubleshooting:
-- - Run `:checkhealth vim.treesitter nvim-treesitter` to see potential issues.
-- - In case of errors related to queries for Neovim bundled parsers (like `lua`,
--   `vimdoc`, `markdown`, etc.), manually install them via 'nvim-treesitter'
--   with `:TSInstall <language>`. Be sure to have necessary system dependencies
--   (see MiniMax README section for software requirements).
now_if_args(function()
	-- Define hook to update tree-sitter parsers after plugin is updated
	local ts_update = function()
		vim.cmd("TSUpdate")
	end
	Config.on_packchanged("nvim-treesitter", { "update" }, ts_update, ":TSUpdate")

	add({
		"https://github.com/nvim-treesitter/nvim-treesitter",
		"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
	})

	local languages = {
		-- These are already pre-installed with Neovim. Used as an example.
		"go",
		"html",
		"javascript",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"query",
		"typescript",
		"vimdoc",
		"yaml",
	}
	local isnt_installed = function(lang)
		return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
	end
	local to_install = vim.tbl_filter(isnt_installed, languages)
	if #to_install > 0 then
		require("nvim-treesitter").install(to_install)
	end

	-- Enable tree-sitter after opening a file for a target language
	local filetypes = {}
	for _, lang in ipairs(languages) do
		for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
			table.insert(filetypes, ft)
		end
	end
	local ts_start = function(ev)
		vim.treesitter.start(ev.buf)
	end
	Config.new_autocmd("FileType", filetypes, ts_start, "Start tree-sitter")
end)

-- Language servers ===========================================================
now_if_args(function()
	add({ "https://github.com/neovim/nvim-lspconfig" })

	vim.lsp.enable({
		"bashls",
		"gopls",
		"jqls",
		"kulala_ls",
		"lua_ls",
		"purescriptls",
		-- "tsgo",
		"vtsls",
	})
end)

later(function()
	add({ "https://github.com/yioneko/nvim-vtsls" })
end)

-- Formatting =================================================================
later(function()
	add({ "https://github.com/stevearc/conform.nvim" })

	require("conform").setup({
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters = {
			kulala = {
				command = "kulala-fmt",
				args = { "format", "$FILENAME" },
				stdin = false,
			},
		},
		formatters_by_ft = {
			go = {
				"goimports",
				"golangci-lint",
			},
			http = {
				"kulala-fmt",
			},
			json = {
				"jq",
			},
			lua = {
				"stylua",
			},
			purescript = {
				"purs-tidy",
			},
			python = {
				"ruff_fix",
				"ruff_format",
				"ruff_organize_imports",
			},
			sql = {
				"sqlfmt",
			},
			typescript = {
				"biome",
				"biome-organize-imports",
				"prettier",
			},
			["*"] = {
				"trim_newlines",
				"trim_whitespace",
			},
		},
		notify_no_formatters = true,
		notify_on_error = false,
	})
end)

-- Snippets ===================================================================
later(function()
	add({ "https://github.com/rafamadriz/friendly-snippets" })
end)

-- Honorable mentions =========================================================

-- 'mason-org/mason.nvim' (a.k.a. "Mason") is a great tool (package manager) for
-- installing external language servers, formatters, and linters. It provides
-- a unified interface for installing, updating, and deleting such programs.
--
-- The caveat is that these programs will be set up to be mostly used inside Neovim.
-- If you need them to work elsewhere, consider using other package managers.
--
-- You can use it like so:
-- now_if_args(function()
--   add({ 'https://github.com/mason-org/mason.nvim' })
--   require('mason').setup()
-- end)

Config.now(function()
	add({
		"https://github.com/darianmorat/gruvdark.nvim",
		"https://github.com/rgroli/other.nvim",
	})

	vim.cmd("color gruvdark")
end)

require("other-nvim").setup({
	mappings = {
		{
			pattern = "(.*)/(.*)%.ts$",
			target = {
				{
					context = "unit test",
					target = "%1/%2.test.ts",
				},
				{
					context = "integration test",
					target = "%1/%2.integration.test.ts",
				},
			},
		},
		{
			context = "implementation",
			pattern = "(.*)/(.*)%.test%.ts$",
			target = "%1/%2.ts",
		},
		{
			context = "implementation",
			pattern = "(.*)/(.*)%.integration%.test%.ts$",
			target = "%1/%2.ts",
		},
	},
	style = {
		border = "rounded",
	},
})
