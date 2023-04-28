-- luacheck: globals vim

local config_path = vim.fn.stdpath("config")
if not vim.loop.fs_stat(config_path .. "/lua/config/lazy.so") then
	vim.cmd.cd(config_path)
	vim.cmd.make()
end

-- c code
require('config.options')
require('config.keybinds')
require('config.lazy')

-- lua code
-- load lazy first, since it enables lua caching
require('config.design').setup()
require('config.journal')
