-- a gui with all kinds of searches

-- luacheck: globals vim

local M = {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},

		'nvim-telescope/telescope-file-browser.nvim',
		'nvim-telescope/telescope-symbols.nvim',
	},
}

function M.config()
	local telescope = require('telescope')
	local borderless = false
	telescope.setup({
		extensions = {},
		defaults = {
			layout_strategy = 'horizontal',
			layout_config = {
				prompt_position = 'top',
			},
			sorting_strategy = 'ascending',
			prompt_prefix = " ",
			selection_caret = " ",
			winblend = borderless and 0 or 10,
		},
	})
	telescope.load_extension('fzf')
	telescope.load_extension('file_browser')
end

return M
