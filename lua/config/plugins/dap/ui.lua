-- luacheck: globals vim

local M = {
	'rcarriga/nvim-dap-ui',
	cmd = 'DapuiToggle',
}

function M.config()
	local dap = require('dap')

	local dapui = require('dapui')

	dapui.setup()

	dap.listeners.after.event_initialized['dapui_config'] = function()
		dapui.open({})
	end
	dap.listeners.before.event_terminated['dapui_config'] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited['dapui_config'] = function()
		dapui.close({})
	end

	vim.api.nvim_create_user_command('DapuiToggle', function() require('dapui').toggle() end, {})
end

return M
