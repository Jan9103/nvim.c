local M = {
	'petertriho/nvim-scrollbar',
	event = 'VeryLazy',
}

function M.config()
	require("scrollbar").setup({
		show = true,
		show_in_active_only = true,
		set_highlights = true,
		max_lines = false,
		hide_if_all_visible = true,
		handlers = {
			cursor = true,
			diagnostic = true,
			gitsigns = false,
			handle = true,
			search = false,
		}
	})
end

return M
