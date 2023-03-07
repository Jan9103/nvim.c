-- list all lsp-errors, etc in a single panel

local M = {
	'folke/trouble.nvim',
	cmd = {'TroubleToggle', 'Trouble'},
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
}

function M.config()
	require("trouble").setup({
		auto_open = false,
		use_diagnostic_signs = true,
	})
end

return M
