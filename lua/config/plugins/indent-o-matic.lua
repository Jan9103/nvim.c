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
	-- defaults
	local pl = require('project-lua').config
	local width = pl.tabstop
	local use_spaces = pl.spaces
	vim.opt.shiftwidth = width
	vim.opt.softtabstop = 0
	vim.opt.expandtab = use_spaces
	vim.opt.tabstop = width
	vim.opt.copyindent = true
	vim.opt.preserveindent = true
	vim.opt.autoindent = true
	vim.opt.smartindent = true
end

function M.config()
	require('indent-o-matic').setup({})
end

return M
