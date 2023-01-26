-- luacheck: globals vim
local nls = require('null-ls')
local pl = require('project-lua').config


local args = {
	extra_args = {
			"--line-length", pl.python.max_line_length,
			"--max-complexity", "139",
			"--ignore", pl.python.ignore,
	},
}

return nls.builtins.diagnostics.ruff.with(args)
