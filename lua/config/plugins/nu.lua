-- everything about the nu scripting language (syntax highlight, tab complete, etc)

local M = {
		'LhKipp/nvim-nu',
		dependencies = {
				'nvim-treesitter/nvim-treesitter',
				'jose-elias-alvarez/null-ls.nvim',
		},
		build = ':TSInstall nu',
		ft = 'nu',
}

function M.config()
	require('nu').setup({
		complete_cmd_names = true,
	})
end

return M
