return {
	{
		"hedyhli/outline.nvim",
		config = function()
			require("outline").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		lazy = true,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"fredrikaverpil/neotest-golang",
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
			"nvim-treesitter/nvim-treesitter"
			-- "antoinemadec/FixCursorHold.nvim",
		},
	},
	{
		'stevearc/conform.nvim',
		opts = {
			format_on_save = {
				-- lsp_format = "fallback",
			},
			formatters_by_ft = {
				go = {
					"golangci-lint",
					"goimports",
				},
				-- lua = {
					--   "luacheck",
					-- },
					python = {
						"ruff_fix",
						"ruff_format",
						"ruff_organize_imports",
					},
				},
				notify_no_formatters = true,
				notify_on_error = true,
			},
		},
		{
			'saghen/blink.cmp',
			opts = {
				completion = {
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 0,
					},
					menu = {
						draw = {
							columns = {
								{ "label",     "label_description", gap = 1 },
								{ "kind_icon", "kind",              gap = 1 },
							},
						},
					},
				},
				keymap = {
					preset = 'default',
					-- ['<cr>'] = { 'select_and_accept' },
				},
				signature = {
					enabled = true,
					window = {
						show_documentation = false,
					},
				},
				snippets = {
					preset = 'luasnip',
				},
				sources = {
					default = { 'lsp', 'path', 'snippets', 'buffer' },
				},
				fuzzy = { implementation = "lua" },
			},
			opts_extend = { "sources.default" },
			version = '1.*',
		},
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			lazy = false,
			opts = {
				diagnostics = {
					enable = true,
				},
				filters = {
					custom = {
						nvim_tree_ignore = {
							".pytest_cache",
							"__pycache__",
							"node_modules",
							"vendor",
						},
					},
				},
				renderer = {
					add_trailing = true,
				},
			},
			version = "*",
		},
		{
			'owickstrom/vim-colors-paramount',
			config = function()
				vim.cmd([[colorscheme paramount]])
			end,
		},
		{ 'eddyekofo94/gruvbox-flat.nvim' },
		{
			'folke/tokyonight.nvim',
			opts = {
				colors = {
					bg = "#222325",
				},
				style = "night",
			},
		},
		{ 'marko-cerovac/material.nvim', },
		{
			'tpope/vim-fugitive',
			dependencies = {
				'tpope/vim-rhubarb',
			},
		},
		{
			'L3MON4D3/LuaSnip',
			build = "make install_jsregexp",
			dependencies = {
				'rafamadriz/friendly-snippets',
			},
			version = "v2.*",
		},
		{
			'nvim-telescope/telescope.nvim',
			dependencies = {
				'benfowler/telescope-luasnip.nvim',
				'mfussenegger/nvim-dap',
				'nvim-lua/plenary.nvim',
				'nvim-lua/popup.nvim',
				'nvim-telescope/telescope-dap.nvim',
				'nvim-telescope/telescope-fzy-native.nvim',
				'nvim-telescope/telescope-live-grep-args.nvim',
				'nvim-telescope/telescope.nvim',
				'otavioschwanck/telescope-alternate.nvim',
			},
			tag = '0.1.8',
		},
		{
			'nvim-treesitter/nvim-treesitter',
			branch = 'master',
			build = ':TSUpdate',
			lazy = false,
			opts = {
				ensure_installed = {
					"c",
					"go",
					"lua",
					"markdown",
					"markdown_inline",
					"query",
					"typescript",
				},
			},
		},
		{
			'gelguy/wilder.nvim',
			build = ':UpdateRemotePlugins',
		},
		{
			'nvim-lualine/lualine.nvim',
			dependencies = { 'nvim-tree/nvim-web-devicons' },
		},
		{
			'MeanderingProgrammer/render-markdown.nvim',
			dependencies = {
				'nvim-tree/nvim-web-devicons',
				'nvim-treesitter/nvim-treesitter',
			},
		},
		{ 'j-hui/fidget.nvim' },
		{ 'moll/vim-bbye' },
		{ 'AndrewRadev/splitjoin.vim' },
		{ 'andymass/vim-matchup' },
		{ 'dhruvasagar/vim-zoom' },
		{ 'tpope/vim-surround' },
		{ 'jiangmiao/auto-pairs' },
		{
			'lewis6991/gitsigns.nvim',
			opts = {
				signs = {
					add = {
						text = "+",
					},
					change = {
						text = "│",
					},
					delete = {
						text = "_",
					},
				},
			},
		},
		{ 'lewis6991/spaceless.nvim' },
		{ 'folke/which-key.nvim' },
	}
