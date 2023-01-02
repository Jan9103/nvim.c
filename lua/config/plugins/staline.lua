-- another status & bufferline

-- luacheck: globals vim

local M = {
	'tamton-aquib/staline.nvim',
	lazy = false,
	dependencies = {
		'kyazdani42/nvim-web-devicons',
	},
}

function M.config()
	vim.opt.laststatus = 2

	local design_config = require('config.design')

	require('staline').setup({
		--- section ---
		sections = {
			left = {
				'- ', '-lsp',
				'- ', 'left_sep',
			},
			mid  = {
				'right_sep_double',
				'-file_name',
				'left_sep_double',
			},
			right = {
				'right_sep', '- ',
				{ 'StalineFill', function() return (design_config.file_icons[vim.o.filetype] or '') .. vim.o.filetype end, }, '- ',
			},
		},
		--- design ---
		mode_colors = { -- dracula
			n = '#bd93f9', -- purple
			i = '#50fa7b', -- green
			v = '#f1fa8c', -- yellow
			r = '#ff5555', -- red
			c = '#ffb86c', -- orange
			[''] = '#44475a', -- gray
		},
		--lsp_symbols = design_config.lsp_symbols,
		file_icons = design_config.file_icons,
	})
end

return M