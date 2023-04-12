return {
	'Apeiros-46B/qalc.nvim',
	cmd = {'Qalc', 'QalcAttach'},
	config = function()
		require('qalc').setup({})
	end,
}
