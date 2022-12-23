-- better syntax highlight

-- luacheck: globals vim

local M = {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
}

function M.config()
	require'nvim-treesitter.configs'.setup {
		-- A list of parser names, or "all"
		ensure_installed = {
			'lua',
			'python',
			'bash',
			'markdown', -- required by headline
		},
		sync_install = false,
		auto_install = false,

		highlight = {
			enable = true,
			disable = {
				'asciidoc', -- default better
				'markdown', -- default better
				'help', -- produces errors
				'vim', -- default better
			},
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
