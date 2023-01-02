-- a floating terminal

-- luacheck: globals vim

local M = {
	'numToStr/FTerm.nvim',
	keys = '<A-b>',
}

function M.config()
	local fterm = require('FTerm')
	fterm.setup({
		border = 'rounded',
		cmd = 'nu',
		auto_close = true, -- exit with <C-d>
		-- on_exit = function() end,
		-- on_stdout
		-- on_stderr
	})
	local monitor = fterm:new({cmd = 'btm'})
	vim.keymap.set('n', '<A-b>', function() monitor:toggle() end)
	vim.keymap.set('t', '<A-b>', function() monitor:close() end)
end

function M.init()
	--vim.api.nvim_create_user_command('FTerm', require('FTerm').open, { bang = true })
	vim.keymap.set('n', '<A-return>', function() require('FTerm').toggle() end)
	vim.keymap.set('t', '<A-return>', function() require('FTerm').close() end)
end

return M