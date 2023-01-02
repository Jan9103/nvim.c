-- language-server simulator (linter -> lsp)

-- luacheck: globals vim

local M = {
	'jose-elias-alvarez/null-ls.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
}

function M.setup(options)
	require('mason-null-ls')

	local nls = require('null-ls')
	local code_actions = nls.builtins.code_actions

	nls.setup({
		debounce = 150,
		save_after_format = false,
		sources = {
			code_actions.gitsigns,
			require('config.plugins.null-ls.diagnostics.mypy'),
			require('config.plugins.null-ls.formatting.ruff'),
			require('config.plugins.null-ls.diagnostics.ruff'),
		},
		on_attach = options.on_attach,
		root_dir = require('null-ls.utils').root_pattern('.git'),
	})
end

function M.has_formatter(ft)
	local sources = require('null-ls.sources')
	local available = sources.get_available(ft, 'NULL_LS_FORMATTING')
	return #available > 0
end

return M
