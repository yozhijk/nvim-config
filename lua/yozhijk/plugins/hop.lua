return {
	"smoka7/hop.nvim",
	version = "*",
	opts = {
		keys = "etovxqpdygfblzhckisuran",
	},
	config = function(_, opts)
		require("hop").setup(opts)

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>h1", "<cmd>HopChar1<CR>", { desc = "Jump to one character" })
		keymap.set("n", "<leader>h2", "<cmd>HopChar2<CR>", { desc = "Jump to two characters" })
		keymap.set("n", "<leader>hl", "<cmd>HopLineStart<CR>", { desc = "Jump to line start" })
		keymap.set("n", "<leader>hp", "<cmd>HopPattern<CR>", { desc = "Jump to pattern" })
		keymap.set("n", "<leader>hw", "<cmd>HopWord<CR>", { desc = "Jump to word" })
	end,
}
