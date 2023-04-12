local M = {
	'kensyo/nvim-scrlbkun',
	event = 'VeryLazy',
}

function M.config()
	require('scrlbkun').setup({
		single_window = true,
		excluded_filetypes = {},
		excluded_buftypes = {"prompt"},
		fadeout_time = 2000, -- ms
		width = 1,

		bar = {
			enable = true,
			draw_columns = {1},
		},

		cursor = {
			enable = true,
			draw_columns = {1},
		},

		search = {
			enable = true,
			draw_columns = {1},
		},

		diagnostics = {
			enable = true,
			draw_columns = {1},
		},

		githunks = {
			enable = false,
		},
	})
end

return M
