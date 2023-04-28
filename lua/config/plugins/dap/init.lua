-- debug adapter protocol
-- run with breakpoints, etc

-- luacheck: globals vim

return {
	'mfussenegger/nvim-dap',
	dependencies = {
		require('config.plugins.dap.ui'),
		require('config.plugins.dap.python'),
	},
	config = function()
		if vim.o.filetype == 'sh' then
			require('config.plugins.dap.bash')
		end
	end,
}
