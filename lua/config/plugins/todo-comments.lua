-- fix syntarx highlight for todo-markers and also mark
-- them as issues for trouble, etc

return {
	'folke/todo-comments.nvim',
	event = 'VeryLazy',
	dependencies = 'nvim-lua/plenary.nvim',
	config = function()
		require('todo-comments').setup({})
	end,
}
