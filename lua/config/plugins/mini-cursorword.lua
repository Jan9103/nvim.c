-- highlight other occurances of the word below the cursor

local M = {
	'echasnovski/mini.cursorword',
	event = 'VeryLazy',
}

function M.config()
	require('mini.cursorword').setup()
end

return M
