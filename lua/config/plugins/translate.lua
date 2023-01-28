local cfg = {
	output = {
		float = {
			max_width = 40,
			max_height = 5,
			close_on_cursor_move = true,
			enter_key = "T",
		},
	},
	translate = {
		{
			cmd = "TransToEn",
			command = "trans",
			args = function(trans_source) return {
				"-b",
				"-e", "google",
				"-t", "en",
				trans_source,
			} end,
			input = "input", -- input|selection|clipboard
			output = { "float_win" }, -- float_win|notify|clipboard
			filter = function(trans_source) return trans_source end,
		},
		{
			"-b",
			cmd = "TransToDe",
			command = "trans",
			args = function(trans_source) return {
				"-e", "google",
				"-t", "de",
				trans_source,
			} end,
			input = "input",
			output = { "float_win" },
			filter = function(trans_source) return trans_source end,
		},
	},
}

return {
	'niuiic/translate.nvim',
	config = function() require('translate').setup(cfg) end,
	cmd = {
		"TransToEn",
		"TransToDe",
	},
}
