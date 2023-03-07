-- highlight and remove trailing spaces

-- luacheck: globals vim

local M = {
	'echasnovski/mini.trailspace',
	cmd = 'TrimTrailingSpaces',
	event = 'BufWritePre',
}

function M.config()
	local trailspace = require('mini.trailspace')
	trailspace.setup()

	vim.api.nvim_create_user_command(
		'TrimTrailingSpaces',
		function() trailspace.trim() end,
		{}
	)

	vim.api.nvim_create_autocmd({'BufWritePre'}, {
		callback = function() require('mini.trailspace').trim_last_lines() end,
	})
end

return M
