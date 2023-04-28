return {
	'folke/twilight.nvim',
	event = 'VeryLazy',
	enabled = false,

	config = function()
		require('twilight').setup({
			dimming = {
				alpha = 0.5,
			},
			exclude = {'markdown'},
		})

		require('twilight.view').enable() -- for some reason it does not auto-start
	end,
}
