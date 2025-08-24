return {
	-- First, set up mason.nvim
	{
		"mason-org/mason.nvim",
		-- This command will trigger the plugin to load
		cmd = "Mason",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	-- Then, set up mason-lspconfig.nvim
	{
		"mason-org/mason-lspconfig.nvim",
		-- This plugin depends on mason.nvim
		dependencies = { "mason-org/mason.nvim", "hrsh7th/cmp-nvim-lsp" },
		-- The `opts` table is a shortcut to call require("mason-lspconfig").setup(opts)
		opts = {
			ensure_installed = {
				"lua_ls",
				"pyright",
				"rust_analyzer",
			},
			handlers = {
				-- The first entry is the "default" handler.
				-- This will apply to every server that doesn't have a specific handler.
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Make sure capabilities is defined
					})
				end,

				-- Next, you can provide targeted overrides for specific servers.
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Make sure capabilities is defined
						on_attach = require("cmp_nvim_lsp").on_attach, -- in the right scope
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
								completion = {
									callSnippet = "Replace",
								},
							},
						},
					})
				end,

				["pyright"] = function()
					require("lspconfig").pyright.setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Make sure capabilities is defined
						on_attach = require("cmp_nvim_lsp").on_attach, -- in the right scope
						filetypes = { "python" },
						settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									diagnosticMode = "openFilesOnly",
									useLibraryCodeForTypes = true,
									typeCheckingMode = "basic",
								},
							},
						},
					})
				end,

				["rust_analyzer"] = function()
					require("lspconfig").rust_analyzer.setup({
						capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Make sure capabilities is defined
						on_attach = require("cmp_nvim_lsp").on_attach, -- in the right scope
						filetypes = { "rust" },
					})
				end,
			},
		},
	},
	--Finally, set up mason-tool-installer.nvim
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- This plugin also depends on mason.nvim
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			-- A list of formatters and linters to install
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				--"rustfmt", -- rust formatter
				"clang-format", -- C/C++ formatter
				"pylint", -- Python linter
				"debugpy", -- Python debugger
			},
		},
	},
}
