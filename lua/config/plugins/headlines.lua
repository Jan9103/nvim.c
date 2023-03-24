-- highlight headings and codeblocks in markdown and neorg

local M = {
	'lukas-reineke/headlines.nvim',
	ft = {'markdown', 'norg'},
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
}

function M.config()
	require('headlines').setup({
		norg = {
			headline_highlights = false,
		},
		markdown = {
			headline_highlights = false,
		},
	})
end

return M
