local dap = require("dap")
local dapui = require("dapui")

require("dap-go").setup()
require("nvim-dap-virtual-text").setup()
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

vim.keymap.set("n", "<leader>dB",
               ":lua require(\"dap\").set_breakpoint(vim.fn.input(\"Breakpoint condition: \"))<cr>")
vim.keymap.set("n", "<leader>db", ":lua require(\"dap\").toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>dc", ":lua require(\"dap\").continue()<cr>")
vim.keymap.set("n", "<leader>dl", ":lua require(\"dap\").run_last()<cr>")
vim.keymap.set("n", "<leader>dn", ":lua require(\"dap\").step_over()<cr>")
vim.keymap.set("n", "<leader>dr", ":lua require(\"dap\").repl.open()<cr>")
vim.keymap.set("n", "<leader>dsi", ":lua require(\"dap\").step_into()<cr>")
vim.keymap.set("n", "<leader>dso", ":lua require(\"dap\").step_out()<cr>")
vim.keymap.set("n", "<leader>dt", ":lua require(\"dap-go\").debug_test()<cr>")
vim.keymap.set("n", "<leader>du", ":lua require(\"dapui\").toggle()<cr>")
