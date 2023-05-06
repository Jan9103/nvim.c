return {
	'AckslD/muren.nvim',
	cmd = 'MurenOpen',
	config = function()
		require('muren').setup({
			create_commands = true,
			filetype_in_preview = true,
		})
	end,
}
