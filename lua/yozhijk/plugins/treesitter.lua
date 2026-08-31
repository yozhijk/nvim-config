local ensure_installed = {
	"json",
	"yaml",
	"html",
	"css",
	"markdown",
	"markdown_inline",
	"bash",
	"lua",
	"vim",
	"dockerfile",
	"gitignore",
	"query",
	"vimdoc",
	"c",
	"cpp",
	"csv",
	"cmake",
	"cuda",
	"glsl",
	"ispc",
	"rust",
	"python",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter").install(ensure_installed)

		-- enable syntax highlighting and indentation for installed parsers
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ensure_installed,
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- enable autotagging (w/ nvim-ts-autotag plugin)
		require("nvim-ts-autotag").setup()
	end,
}
