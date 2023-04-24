return {
	'zioroboco/nu-ls.nvim',
	config = function()
		require('null-ls').register(require('nu-ls'))
	end,
}
