-- luacheck: globals vim
local dap = require('dap')

-- if dap.adapters.bashdb then
-- 	return
-- end

local bda_dir = vim.fn.stdpath('data') .. '/mason/packages/bash-debug-adapter'

dap.adapters.bashdb = {
	type = 'executable',
	command = bda_dir .. '/bash-debug-adapter',
	name = 'bashdb',
}

dap.configurations.sh = {{
	type = 'bashdb',
	request = 'launch',
	name = 'Launch file',
	showDebugOutput = true;
	pathBashdb = bda_dir .. '/extension/bashdb_dir/bashdb';
	pathBashdbLib = bda_dir .. '/extension/bashdb_dir';
	trace = true;
	file = "${file}";
	program = "${file}";
	cwd = '${workspaceFolder}';
	pathCat = "cat";
	pathBash = "/bin/bash";
	pathMkfifo = "mkfifo";
	pathPkill = "pkill";
	args = {};
	env = {};
	terminalKind = "integrated";
}}
