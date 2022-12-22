local M = {
	'Mofiqul/dracula.nvim',
	lazy = false,
}

function M.config()
	vim.cmd([[colorscheme dracula]])
end

return M
