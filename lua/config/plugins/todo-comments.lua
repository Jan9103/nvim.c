local M = {
	'folke/todo-comments.nvim',
	event = "BufReadPost",
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
}

function M.config()
	require("todo-comments").setup{}
end

return M
