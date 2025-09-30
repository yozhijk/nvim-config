return {
	"phaazon/hop.nvim",
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		--
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>h1", "<cmd>HopChar1<CR>", { desc = "Jump to one character" })
		keymap.set("n", "<leader>h2", "<cmd>HopChar2<CR>", { desc = "Jump to two characters" })
		keymap.set("n", "<leader>hl", "<cmd>HopLineStart<CR>", { desc = "Jump to line start" })
		keymap.set("n", "<leader>hp", "<cmd>HopPattern<CR>", { desc = "Jump to pattern" })
		keymap.set("n", "<leader>hw", "<cmd>HopWord<CR>", { desc = "Jump to word" })
	end,
}
