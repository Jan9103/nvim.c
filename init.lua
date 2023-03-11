-- luacheck: globals vim

local config_path = vim.fn.stdpath("config")
if not vim.loop.fs_stat(config_path .. "/lua/init.so") then
	vim.cmd.cd(config_path)
	vim.cmd.make("all")
end

require('init')

require('config.lazy')
require('config.statusline').setup()

-- for some reason these 3 arent applied when written from rust
vim.o.number = true
vim.o.relativenumber = true
vim.o.foldlevel = 99
