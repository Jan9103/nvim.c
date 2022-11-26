-- luacheck: globals vim
require'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all"
	ensure_installed = {},

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	auto_install = false,

	-- List of parsers to ignore installing (for "all")
	-- ignore_install = { "javascript" },
	ignore_install = {
		'markdown',-- the highlight is worse than VIMs
		'help',    -- causes a lot of errors
	},

	highlight = {
		-- `false` will disable the whole extension
		enable = true,

		disable = {
			'markdown',
			'vim',
			'asciidoc',
			'help',
		},

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	indent = {
		enable = true
	},
}

vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
	group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
	callback = function()
		vim.opt.foldmethod = 'expr'
		vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
	end
})
