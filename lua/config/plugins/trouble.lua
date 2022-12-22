local M = {
	'folke/trouble.nvim',
	cmd = {'TroubleToggle', 'Trouble'},
	dependencies = {
		'kyazdani42/nvim-web-devicons',
	},
}

function M.config()
	require("trouble").setup({
		auto_open = false,
		use_diagnostic_signs = true,
	})
end

return M
