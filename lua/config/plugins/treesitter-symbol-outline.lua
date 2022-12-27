-- treeview for treesitter tree

local M = {
	'simrat39/symbols-outline.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	cmd = {
		'SymbolsOutline',
		'SymbolsOutlineOpen',
		'SymbolsOutlineClose',
	},
}

function M.config()
	require("symbols-outline").setup({
		highlight_hovered_item = true,
		show_guides = true,
		auto_preview = true,
		auto_close = true,
	})
end

return M
