-- highlight headings and codeblocks in markdown and neorg

local M = {
	'lukas-reineke/headlines.nvim',
	ft = {'markdown', 'norg'},
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
}

function M.config()
	require('headlines').setup()
end

return M
