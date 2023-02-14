local defaults = {
	python = {
		max_line_length = 120,
		ignore = "",
		lint = true,
		mypy = {
			--enabled = true,
			strict = true,
			ignore_missing_imports = false,
		},
	},
}

return {'jan9103/project.lua.nvim',
	config = function() require('project-lua').setup(defaults) end,
}
