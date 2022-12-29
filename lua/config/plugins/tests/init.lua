-- luacheck: globals vim

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

	-- i should never need two languages at once
	if ft == 'python' then
		adapters[#adapters+1] = python.adapter()
	elseif ft == 'rust' then
		adapters[#adapters+1] = rust.adapter()
	end

	require("neotest").setup({
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
end

function M.init()
	local function cmd(name, func)
		vim.api.nvim_create_user_command(name, func, {})
	end
	cmd('NeotestRunTest',    function(_) require("neotest").run.run() end)
	cmd('NeotestRunFile',    function(_) require("neotest").run.run(vim.fn.expand("%")) end)
	cmd('NeotestDebugTest',  function(_) require("neotest").run.run({strategy = "dap"}) end)
	cmd('NeotestStopTest',   function(_) require("neotest").run.stop() end)
	cmd('NeotestAttachTest', function(_) require("neotest").run.attach() end)
	cmd('NeotestSummary',    function(_) require('neotest').summary.open() end)
	cmd('NeotestPanel',      function(_) require('neotest').output_panel.open() end)
end

return M
