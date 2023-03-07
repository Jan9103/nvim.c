-- draw boxes and arrows

-- luacheck: globals vim
local M = {
	'jbyuki/venn.nvim',
	cmd = 'VBox',
	keys = 'faa',
	dependencies = {
		'anuvyklack/hydra.nvim',
	},
}

function M.config()
	require('hydra')({
		name = 'Draw Diagram',
		hint = [[
Arrow^^^^^^   Select region with <C-v>
^ ^ _w_ ^ ^   _f_: surround it with box
_a_ ^ ^ _s_
^ ^ _r_ ^ ^                      _<Esc>_]],
		config = {
			color = 'pink',
			invoke_on_body = true,
			hint = {border = 'rounded'},
			on_enter = function()
				vim.o.virtualedit = 'all'
			end,
		},
		mode = 'n',
		body = 'faa',
		heads = {
			--{ 'H', '<C-v>h:VBox<CR>' },
			{ 'a', '<C-v>h:VBox<CR>' },
			--{ 'J', '<C-v>j:VBox<CR>' },
			{ 'r', '<C-v>j:VBox<CR>' },
			--{ 'K', '<C-v>k:VBox<CR>' },
			{ 'w', '<C-v>k:VBox<CR>' },
			--{ 'L', '<C-v>l:VBox<CR>' },
			{ 's', '<C-v>l:VBox<CR>' },
			{ 'f', ':VBox<CR>', { mode = 'v' }},
			{ '<Esc>', nil, { exit = true } },
		}
	})
end

return M
