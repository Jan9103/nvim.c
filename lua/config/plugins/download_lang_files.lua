return {
	'jan9103/download-lang-files.nvim',
	cmd = 'DownloadSpellLang',
	dependencies = 'nvim-lua/plenary.nvim',
	config = function()
		require('download-lang-files').setup()
	end,
}
