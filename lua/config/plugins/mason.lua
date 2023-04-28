-- packagemanager for language-server, linter, etc

local M = {
	'williamboman/mason.nvim',
	cmd = 'Mason',
}

function M.config()
	require('mason').setup({
		ui = {
			check_outdated_packages_on_open = false,
			border = 'rounded',
		},
	})
end

return M
