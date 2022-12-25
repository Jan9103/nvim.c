-- a notification rework

-- luacheck: globals vim

local M = {
	'rcarriga/nvim-notify',
}

function M.config()
	require('notify').setup({
		timeout = 3000,
		level = vim.log.levels.INFO,
		fps = 20,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.collumns * 0.75)
		end,
		stages = 'slide',
	})
end

return M
