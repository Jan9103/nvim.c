-- a gui rework (notifications, command-line, search, etc)

local M = {
	'folke/noice.nvim',
	event = 'VeryLazy',
	dependencies = {
		'MunifTanjim/nui.nvim',
	},
}

function M.config()
	require('noice').setup({
		lsp = {
			override = {
				['vim.lsp.util.convert_input_to_markdown_lines'] = true,
				['vim.lsp.util.stylize_markdown'] = true,
				['cmp.entry.get_documentation'] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = true,
			cmdline_output_to_split = false,
		},
		commands = {
			--all = {
			--	view = 'popup', -- split, lsp_progress, nil, hover
			--	opts = {enter = true, format = 'details'},
			--	filter = {},
			--},
			hover = {
				view = 'hover',
			},
			signature = {
				view = 'hover',
			},
		},
	})

end

return M
