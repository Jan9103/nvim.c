-- show where a function/variables is defined, used, etc (lsp)

local M = {
	'dnlhc/glance.nvim',
	cmd = {'Glance'},
}

function M.config()
	require('glance').setup({
	})
end

return M
