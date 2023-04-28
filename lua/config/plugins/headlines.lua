-- highlight headings and codeblocks in markdown and neorg

return {
	'lukas-reineke/headlines.nvim',
	ft = 'markdown',
	dependencies = 'nvim-treesitter/nvim-treesitter',
	config = function()
		require('headlines').setup({
			markdown = {
				headline_highlights = false,
			},
		})
	end
}
