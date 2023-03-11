-- luacheck: globals vim

-- load
require('lazy').setup('config.plugins', {
	defaults = { lazy = true },
	install = {
		colorscheme = {'dracula'},
	},
	ui = {
		border = 'rounded', -- none, single, double, rounded, solid, shadow
	},
	change_detection = {
		enabled = false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				'gzip',
				'matchit',
				'netrwPlugin',
				'tarPlugin',
				'tohtml',
				'tutor',
				'zipPlugin',
				--'matchparen',
			},
		},
	},
})
