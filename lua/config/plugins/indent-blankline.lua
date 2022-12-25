-- highlight indentation lines

local M = {
	'lukas-reineke/indent-blankline.nvim',
}

function M.config()
	require('indent_blankline').setup({
		show_current_context = true, -- highlight current indentation
		show_current_context_start = false, -- underline start-line
	})
end

return M
