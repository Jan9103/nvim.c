-- luacheck: globals vim

local M = {
	'mfussenegger/nvim-dap-python',
	ft = 'python',
}

function M.config()
	require('dap-python').setup(vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python')

	local dap = require('dap')

	dap.configurations.python = {{
		type = 'python',
		request = 'launch',
		name = 'Launch file',
		program = '${file}',
		pythonPath = function()
			return '/usr/bin/python'
		end,
	}}
end

return M
