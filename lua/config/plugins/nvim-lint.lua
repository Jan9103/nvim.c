-- luacheck: globals vim
-- https://github.com/mfussenegger/nvim-lint

local M = {
	'mfussenegger/nvim-lint',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
}

function M.config()
	local lint = require('lint')

	lint.linters_by_ft = {
		lua = {'luacheck',},
		plaintex = {'chktex',},  -- latex
		rst = {'vale', 'rstcheck', 'rstlint',},
		vim = {'vint',},
		yaml = {'yamllint',},
	}

	vim.api.nvim_create_autocmd({'BufWritePost', 'BufReadPost'}, {
		callback = function() lint.try_lint() end,
	})
end

return M
