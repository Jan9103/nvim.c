-- luacheck: globals vim
-- https://github.com/mfussenegger/nvim-lint
local lint = require('lint')

lint.linters_by_ft = {
	lua = {'luacheck',},
	--markdown = {'vale',},
	plaintex = {'chktex',},  -- latex
	rst = {'vale', 'rstcheck', 'rstlint',},
	--sh = {'shellcheck',}, -- bashls already takes care of it
	vim = {'vint',},
	yaml = {'yamllint',},
}

vim.api.nvim_create_autocmd({'BufWritePost', 'BufReadPost'}, {
	callback = function() lint.try_lint() end,
})
