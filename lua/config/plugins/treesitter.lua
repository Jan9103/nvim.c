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
			'regex', 'markdown_inline', 'vim', -- required by noice.nvim
		},
		sync_install = true,
		auto_install = false, -- does not work for some reason
		ignore_install = {
			'asciidoc', -- default better
			'help', -- bugged
		},

		highlight = {
			enable = true,
			disable = {
				'asciidoc', -- default better
				'diff',  -- diff highlighting is really bad (no green/red for added/removed, only 1 format, etc)
				'help', -- produces errors
				'markdown', -- default better
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
