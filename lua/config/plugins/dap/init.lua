-- debug adapter protocol
-- run with breakpoints, etc

-- luacheck: globals vim

-- 'rcarriga/cmp-dap'
-- 'jayp0521/mason-nvim-dap.nvim'
local M = {
	'mfussenegger/nvim-dap',
	dependencies = {
		require('config.plugins.dap.ui'),
		require('config.plugins.dap.python'),
	},
}

local function loadFT()
	if vim.o.filetype == 'sh' then
		require('config.plugins.dap.bash')
	end
end

function M.config()
	loadFT()
end

return M
