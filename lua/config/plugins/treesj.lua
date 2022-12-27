-- expand/shrink sections

local M = {
	'Wansmer/treesj',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
	cmd = {
		'TSJToggle',
		'TSJSplit',
		'TSJJoin',
	},
}

function M.config()
	require('treesj').setup({
		use_default_keymaps = false,
		check_syntax_error = true,
		max_join_length = 120,
		cursor_behavior = 'hold',
		notify = true,
	})
end

return M
