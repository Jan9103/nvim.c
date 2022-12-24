-- another status & bufferline

local M = {
	'tamton-aquib/staline.nvim',
	lazy = false,
	dependencies = {
		'kyazdani42/nvim-web-devicons',
	},
}

function M.config()
	vim.opt.laststatus = 2

	require('staline').setup({
		--- section ---
		sections = {
			left = { 'left_sep', ' ', 'lsp' },
			mid  = { 'right_sep_double', '-file_name', 'left_sep_double' },
			right = { function() return vim.o.filetype end , ' ', 'right_sep' },
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
		lsp_symbols = {
			Error=" ",
			Info=" ",
			Warn=" ",
			Hint=" ",
		},
		file_icons = {
			bash=' ',
			c=' ',
			conf=' ',
			cpp=' ',
			css=' ',
			dockerfile=' ',
			dosini=' ',
			gitcommit=' ',
			go=' ',
			haskell=' ',
			html=' ',
			java=' ',
			javascript=' ',
			javascriptreact=' ',
			json=' ',
			lua=' ',
			markdown=' ',
			nu=' ',
			php=' ',
			python=' ',
			ruby=' ',
			rust=' ',
			scss=' ',
			sh=' ',
			text=' ',
			toml=' ',
			typescript=' ',
			vim=' ',
			zsh=' ',
		},
	})
end

return M
