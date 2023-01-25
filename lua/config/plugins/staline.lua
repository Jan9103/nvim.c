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

	local d = require('config.design')

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
				{ 'StalineFill', function() return (d.file_icons[vim.o.filetype] or '') .. vim.o.filetype end, }, '- ',
			},
		},
		--- design ---
		mode_colors = { -- dracula
			n = d.c.purple, -- purple
			i = d.c.green, -- green
			v = d.c.yellow, -- yellow
			r = d.c.red, -- red
			c = d.c.orange, -- orange
			[''] = d.c.gray, -- gray
		},
		--lsp_symbols = design_config.lsp_symbols,
		file_icons = d.file_icons,
	})
end

return M
