-- auto close brackets
-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-pairs.md

local M = {
	'echasnovski/mini.pairs',
	event = 'VeryLazy',
}

function M.config()
	require('mini.pairs').setup()
end

return M
