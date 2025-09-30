-- lua/plugins/multi-cursor.lua
return {
	"mg979/vim-visual-multi",
	branch = "master",
	config = function()
		local keymap = vim.keymap
		-- You can leave this empty for default settings
		-- or add custom keybindings here if you wish.
		-- For example:
		-- vim.g.VM_maps = {
		--   ['Find Under'] = '<C-d>',
		-- }
		keymap.set("v", "<Leader>g", "<Plug>(VM-Visual-Cursors)", { silent = true })
	end,
}
