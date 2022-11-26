-- luacheck: globals vim
-- bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/impatient.nvim/start/impatient.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify('Installing Impatiet.nvim…')
	fn.system({
		'git', 'clone', '--depth', '1', 'https://github.com/lewis6991/impatient.nvim.git', install_path
	})
	vim.cmd [[packadd impatient.nvim]]
	vim.notify('Installed Impatiet.nvim')
end

--require('impatient').enable_profile()
require('impatient')
