-- luacheck: globals vim
local nls = require('null-ls')
local utils = require('null-ls.utils')

local args = {}

function args.runtime_condition(params)
	return utils.path.exists(params.bufname)
end

function args.cwd(params)
	-- workaround to get it to work at all
	-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1208#issuecomment-1343562820
	return vim.fn.getcwd()

	-- updated version of the workaround:
	-- the lowest directory containing a `__init__.py` is the root.
	-- local start_path = params.bufname
	-- local parent_path = start_path

	-- for path in vim.fs.parents(start_path) do
	-- 	if not utils.path.exists(utils.path.join(path, '__init__.py')) then
	-- 		return parent_path
	-- 	end
	-- 	parent_path = path
	-- end

	-- return vim.fn.getcwd()
end

return nls.builtins.diagnostics.mypy.with(args)
