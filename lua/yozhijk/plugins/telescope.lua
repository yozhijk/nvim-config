return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		-- Workaround for nvim-treesitter removing ft_to_lang (nvim 0.12+)
		local ok, ts_parsers = pcall(require, "nvim-treesitter.parsers")
		if ok and not ts_parsers.ft_to_lang then
			ts_parsers.ft_to_lang = function(ft)
				return vim.treesitter.language.get_lang(ft) or ft
			end
		end

		-- Workaround for nvim-treesitter removing the configs module entirely (nvim 0.12+)
		if not pcall(require, "nvim-treesitter.configs") then
			package.preload["nvim-treesitter.configs"] = function()
				return {
					is_enabled = function(_, lang, bufnr)
						return pcall(vim.treesitter.get_parser, bufnr, lang) and true or false
					end,
				}
			end
		end

		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				preview = {
					treesitter = false,
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		-- telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find open buffers" })
		keymap.set(
			"n",
			"<leader>fl",
			require("telescope.builtin").current_buffer_fuzzy_find,
			{ desc = "Fuzzy find in current buffer" }
		)
	end,
}
