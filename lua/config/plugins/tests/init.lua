-- luacheck: globals vim
--

-- https://github.com/nvim-neotest/neotest#supported-runners
-- https://github.com/nvim-neotest/neotest-vim-test

local python = require('config.plugins.tests.python')
local rust = require('config.plugins.tests.rust')

local M = {
	'nvim-neotest/neotest',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		require('config.plugins.tests.coverage'),
		python.dependency,
		rust.dependency,
	},
}

function M.config()
	local adapters = {}
	local ft = vim.o.filetype
	local neotest = require('neotest')

	-- i should never need two languages at once
	if ft == 'python' then
		adapters[#adapters+1] = python.adapter()
	elseif ft == 'rust' then
		adapters[#adapters+1] = rust.adapter()
	end

	neotest.setup({
		adapters = adapters,
		status = {
			enabled = true,
			virtual_text = false, -- sign column at end of column
			signs = true,
		},
		floating = {
			border = 'rounded',
		},
		summary = {
			enabled = true,
			animated = true,
			follow = true,
			mappings = {
				expand = '<CR>',
				expand_all = nil,
				output = nil,
				short = nil,
				attach = 'a',
				jumpto = 'i',
				stop = {'u', 'x'},
				run = {'r', '<space>'},
				debug = 'd',
				mark = '+',
				run_marked = 'R',
				debug_marked = 'D',
				target = nil,
				clear_target = nil,
				next_failed = 'n',
				prev_failet = 'N',
			},
		},
		benchmark = {enabled = true},
		output = {
			enabled = true,
			open_on_run = 'short',
		},
		output_panel = {enabled = true},
		diagnostic = {enabled = true},
		run = {enabled = true},
		jump = {enabled = true},
		projects = {},
	})

	vim.api.nvim_create_user_command('NeotestRunTest',   function() neotest.run.run() end, {})
	vim.api.nvim_create_user_command('NeotestRunFile',   function() neotest.run.run(vim.fn.expand("%")) end, {})
	vim.api.nvim_create_user_command('NeotestDebugTest', function() neotest.run.run({strategy = "dap"}) end, {})
	vim.api.nvim_create_user_command('NeotestStopTest',  function() neotest.run.stop() end, {})
	vim.api.nvim_create_user_command('NeotestAttachTest',function() neotest.run.attach() end, {})
	vim.api.nvim_create_user_command('NeotestSummary',   function() neotest.summary.open() end, {})
	vim.api.nvim_create_user_command('NeotestPanel',     function() neotest.output_panel.open() end, {})
end

return M
