-- select treesitter ranges (functions, if-blocks, etc)

-- luacheck: globals vim

local M = {
	'kiyoon/treesitter-indent-object.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	keys = {
		{'ai', ":lua require('treesitter_indent_object.textobj').select_indent_outer()<cr>", mode = {'x', 'o'}},
		{'ii', ":lua require('treesitter_indent_object.textobj').select_indent_inner()<cr>", mode = {'x', 'o'}},
	},
}

return M
