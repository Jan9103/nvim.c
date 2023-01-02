-- luacheck: globals vim
local nls = require('null-ls')

local args = {
	extra_args = {
			"--line-length",
			"100",
			"--max-complexity",
			"139",
	},
}

return nls.builtins.diagnostics.ruff.with(args)
