-- luacheck: globals vim

local config_path = vim.fn.stdpath('config')

if not vim.loop.fs_stat(config_path .. '/lua/init.so') then
	vim.cmd.cd(config_path)
	vim.cmd.make() -- compile c
end
require('init')

require('config.lazy')
require('config.options')
require('config.keymaps')
require('config.statusline').setup()
vim.cmd('colorscheme mytheme')
