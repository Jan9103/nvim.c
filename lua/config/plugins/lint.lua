-- add linter

-- luacheck: globals vim

local linters_by_ft = {
	lua = {'luacheck',},
	plaintex = {'chktex',},  -- latex
	--python = {'ruff',},
	rst = {'vale', 'rstcheck', 'rstlint',},
	vim = {'vint',},
	yaml = {'yamllint',},
}

-- `ft=filetypes` does not work for some reason
local filetypes = {}
for k,_ in pairs(linters_by_ft) do
	filetypes[#filetypes + 1] = k
end

local M = {
	'mfussenegger/nvim-lint',
	--lazy = false,
	ft = filetypes,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
}

function M.config()
	local lint = require('lint')

	lint.linters_by_ft = linters_by_ft

	vim.api.nvim_create_autocmd({'BufWritePost', 'BufReadPost'}, {
		callback = function() lint.try_lint() end,
	})

	lint.try_lint()  -- due to lazyloading `BufReadPost` never triggers
end

return M
