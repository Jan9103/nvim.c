-- highlight which lines have changed, toggle staging, etc
-- command: Gitsigns

return {
	'lewis6991/gitsigns.nvim',
	cmd = 'Gitsigns',
	config = function()
		require('gitsigns').setup({
			signcolumn = false,
		})
	end,
}
