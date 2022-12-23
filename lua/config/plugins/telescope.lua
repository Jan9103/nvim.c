-- a gui with all kinds of searches

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

return M
