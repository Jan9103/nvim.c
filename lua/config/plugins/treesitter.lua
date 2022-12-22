-- luacheck: globals vim

local M = {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
}

function M.config()
	local disabled_syntaxes = {
		'asciidoc',
		'help', -- errors..
		'markdown', -- turns stuff invisible, which i want to see
		'vim',
	}

	require'nvim-treesitter.configs'.setup {
		-- A list of parser names, or "all"
		ensure_installed = {
			'lua',
			'python',
			'bash',
		},
		sync_install = false,
		auto_install = false,
		ignore_install = disabled_syntaxes,

		highlight = {
			enable = true,
			disable = disabled_syntaxes,
			additional_vim_regex_highlighting = false,
		},

		indent = {
			enable = true,
		},
	}

	vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
		group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
		callback = function()
			vim.opt.foldmethod = 'expr'
			vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
		end
	})
end

return M
