return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters.python = {
			type = "executable",
			command = "/Users/yozhijk/dev/libs/miniforge3/bin/python",
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = function()
					return "/Users/yozhijk/dev/libs/miniforge3/bin/python"
				end,
			},
		}
		local keymap = vim.keymap
		keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "Toggle debug breakpoint" })
		keymap.set("n", "<F5>", "<cmd>DapContinue<CR>", { desc = "Debug / continue" })
		keymap.set("n", "<F6>", "<cmd>DapTerminate<CR>", { desc = "Debug: terminate" })
		keymap.set("n", "<F11>", "<cmd>DapStepInto<CR>", { desc = "Debug: step into" })
		keymap.set("n", "<F10>", "<cmd>DapStepOver<CR>", { desc = "Debug: step over" })
	end,
}
