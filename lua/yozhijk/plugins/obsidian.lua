return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "oracle",
				path = "~/dev/oracle",
			},
		},

		-- Oracle uses standard markdown links, not [[wikilinks]] (see AGENTS.md)
		link = { style = "markdown" },
		frontmatter = { enabled = false },

		picker = {
			name = "telescope.nvim",
		},

		note_id_func = function(title)
			return title
		end,

		legacy_commands = false,

		ui = { enable = false }, -- rely on treesitter markdown highlighting instead
	},
	keys = {
		{ "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian: quick switch note" },
		{ "<leader>os", "<cmd>Obsidian search<cr>", desc = "Obsidian: search vault" },
		{ "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian: backlinks" },
		{ "<leader>ot", "<cmd>Obsidian toc<cr>", desc = "Obsidian: table of contents" },
		{ "<leader>of", "<cmd>Obsidian follow_link<cr>", desc = "Obsidian: follow link under cursor" },
		{ "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian: new note" },
	},
}
