-- luacheck: globals vim

-- bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'https://github.com/folke/lazy.nvim.git',
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

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
