-- a gui with all kinds of searches

-- luacheck: globals vim

local M = {
	'nvim-telescope/telescope.nvim',
	cmd = 'Telescope',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'BurntSushi/ripgrep',
		{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},

		'nvim-telescope/telescope-file-browser.nvim',
		'nvim-telescope/telescope-symbols.nvim',
	},
}

function M.project_files(opts)
	opts = opts or {}
	opts.show_untracked = true
	if vim.loop.fs_stat('.git') then
		require('telescope.builtin').git_files(opts)
	else
		local client = vim.lsp.get_active_clients()[1]
		if client then
			opts.cwd = client.config.root_dir
		end
		require('telescope.builtin').find_files(opts)
	end
end

function M.config()
	local telescope = require('telescope')
	local borderless = false
	telescope.setup({
		extensions = {},
		defaults = {
			layout_strategy = 'horizontal',
			layout_config = {
				prompt_position = 'top',
			},
			sorting_strategy = 'ascending',
			--mappings = {
			--	i = {
			--		['<C-Down>'] = require('telescope.actions').cycle_history_next,
			--		['<C-Up>'] = require('telescope.actions').cycle_history_prev,
			--	},
			--},
			prompt_prefix = " ",
			selection_caret = " ",
			winblend = borderless and 0 or 10,
		},
	})
	telescope.load_extension('fzf')
	telescope.load_extension('file_browser')
end

function M.init()
	vim.keymap.set('n', 'ftf', function() require('telescope.builtin').find_files() end) -- file-opener
	vim.keymap.set('n', 'ftg', function() require('telescope.builtin').live_grep()  end) -- grep.
	vim.keymap.set('n', 'fb', function() require('telescope.builtin').buffers() end) -- buffer-switcher
	vim.keymap.set('n', 'ftd', function() require('telescope.builtin').lsp_document_symbols({symbols = 'function'}) end)
end

return M
