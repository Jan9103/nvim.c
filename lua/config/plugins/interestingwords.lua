local M = {
	'Mr-LLLLL/interestingwords.nvim',
	keys = {'<leader>w#', '<leader>wc'},
}

function M.config()
	local c = require('config.design.config').c
	require("interestingwords").setup({
		colors = { c.cyan, c.green, c.orange, c.pink, c.purple, c.yellow },
		search_count = false,
		navigation = false,
		search_key = '<leader>w#',
		cancel_search_key = '<leader>Qw#',
		color_key = '<leader>wc',
		cancel_color_key = '<leader>Qwc',
	})
end

return M
