-- auto detect indentation
-- alternatives:
-- - tpope/vim-sleuth
-- - NMAC427/guess-indent.nvim

-- luacheck: globals vim

local M = {
	'Darazaki/indent-o-matic',
	lazy = false,
}

function M.init()
	vim.opt.shiftwidth = 2
	vim.opt.softtabstop = 0
	vim.opt.expandtab = false
	vim.opt.tabstop = 2
	vim.opt.copyindent = true
	vim.opt.preserveindent = true
	vim.opt.autoindent = true
	vim.opt.smartindent = true
end

function M.config()
	require('indent-o-matic').setup({})
end

return M
