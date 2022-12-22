-- 'rcarriga/cmp-dap'
-- 'jayp0521/mason-nvim-dap.nvim'
local M = {
	'mfussenegger/nvim-dap',
	dependencies = {
		{'rcarriga/nvim-dap-ui',
			config = function()
				require('dapui').setup()
			end,
		},
	},
}

function M.config()
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


	local dapui = require('dapui')
	dap.listeners.after.event_initialized['dapui_config'] = function()
		dapui.open({})
	end
	dap.listeners.before.event_terminated['dapui_config'] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited['dapui_config'] = function()
		dapui.close({})
	end
end

return M
