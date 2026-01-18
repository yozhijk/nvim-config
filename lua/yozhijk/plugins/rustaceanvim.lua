return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	dependencies = { "mason-org/mason.nvim" },
	config = function()
		-- 1. Calculate the path manually (Avoids the API crash)
		--    Mason always installs packages in stdpath("data") .. "/mason/packages/..."
		local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb"
		local codelldb_path = mason_path .. "/extension/adapter/codelldb"
		local liblldb_path = mason_path .. "/extension/lldb/lib/liblldb.so"

		-- 2. Check if the files actually exist before trying to use them
		local adapter = nil
		if vim.fn.filereadable(codelldb_path) == 1 then
			adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb_path, liblldb_path)
		end

		vim.g.rustaceanvim = {
			tools = {
				float_win_config = {
					border = "rounded",
				},
			},
			server = {
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = true,
						check = {
							command = "clippy",
						},
						positionEncoding = "utf-8",
					},
				},
			},
			-- 3. Pass the adapter (nil if not installed, safe object if installed)
			dap = {
				adapter = adapter,
			},
		}
	end,
}
