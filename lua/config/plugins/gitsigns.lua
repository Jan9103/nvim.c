local M = {
	'lewis6991/gitsigns.nvim',
	cmd = 'Gitsigns',
}

function M.config()
	require('gitsigns').setup()
end

return M
