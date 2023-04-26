local M = {
	'numToStr/Comment.nvim',
	keys = {
		-- line comments
		'gc',
		{'gc', mode = 'v'},
		-- block comments
		'gb',
		{'gb', mode = 'v'},
	},
}

function M.config()
	require('Comment').setup({
		padding = true,
		sticky = true,  -- keep cursor position
		ignore = nil,
		toggler = {
			line = 'gcc',
			block = 'gbc',
		},
		opleader = {
			line = 'gc',
			block = 'gb',
		},
		extra = {
			above = 'gcO',
			below = 'gco',
			eol = 'gcA',
		},
		mappings = {
			basic = true,
			extra = true,
		},
		pre_hook = nil,  -- function to call before
		post_hook = nil,  -- function to call after
	})
end

return M
