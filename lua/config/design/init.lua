local M = {}

function M.setup()
	vim.cmd('colorscheme mytheme')

	require('config.design.notify').setup()
	require('config.design.statusline').setup()
	require('config.design.folds').setup()
end

return M
