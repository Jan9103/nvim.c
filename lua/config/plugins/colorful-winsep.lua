local M = {
	'nvim-zh/colorful-winsep.nvim',
	event = 'VeryLazy',
}

function M.config()
	local d = require('config.design')
	require('colorful-winsep').setup({
		highlight = {
			bg = d.c.bg,
			fg = d.c.purple,
		},
	})
end

return M
