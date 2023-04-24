-- everything about the nu scripting language (syntax highlight, tab complete, etc)

-- moved LSP features to null-ls/default.lua, since a new plugin
-- has better support

local M = {
		'LhKipp/nvim-nu',
		dependencies = {
				'nvim-treesitter/nvim-treesitter',
				--'jose-elias-alvarez/null-ls.nvim',
		},
		build = ':TSInstall nu',
		ft = 'nu',
}

function M.config()
	require('nu').setup({
		use_lsp_features = false,
	})
end

return M
