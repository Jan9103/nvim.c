-- highlight and remove trailing spaces

-- luacheck: globals vim

local M = {
	'echasnovski/mini.trailspace',
}

function M.init()
	vim.api.nvim_create_user_command(
		'TrimTrailingSpaces',
		function(_)
			require('mini.trailspace').trim()
		end,
		{}
	)

	vim.api.nvim_create_autocmd({'BufWritePre'}, {
		callback = function()
			require('mini.trailspace').trim_last_lines()
		end
	})
end

function M.config()
	require('mini.trailspace').setup()
end

return M
