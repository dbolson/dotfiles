return {
	{
		'nvim-neotest/neotest',
		dependencies = {
			'nvim-neotest/nvim-nio',
			'nvim-lua/plenary.nvim',
			'nvim-neotest/neotest-jest',
			'nvim-neotest/neotest-python',
			'antoinemadec/FixCursorHold.nvim',
      {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        build = function()
          vim.cmd([[:TSUpdate go]])
        end,
      },
      {
        'fredrikaverpil/neotest-golang',
        version = '*',
        build = function()
          vim.system({'go', 'install', 'gotest.tools/gotestsum@latest'}):wait()
        end,
      },
		},
    config = function()
      local config = {
        runner = 'gotestsum',
      }
      require('neotest').setup({
        adapters = {
          require("neotest-jest"),
          require('neotest-golang')(config),
          require("neotest-python")({
            runner = "pytest",
          }),
        },
      })
    end,
    opts = {
      adapters = {
        ['neotest-jest'] = {
          jestCommand = 'npm test -- --detectOpenHandles',
        }
      }
    }
	},
}
