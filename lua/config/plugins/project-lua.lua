local defaults = {
	tabstop = 2,
	spaces = false,
	python = {
		max_line_length = 120,
		ruff = {
			lint = true,
			pyproject = false,
			ignore = "",
		},
		mypy = {
			--enabled = true,
			strict = true,
			ignore_missing_imports = false,
		},
	},
	securitree = {
		autostart = false,
		autocmd = true,
	},
}

return {'jan9103/project.lua.nvim',
	config = function()
		local plp = require('project-lua')
		plp.setup(defaults)
		local pl = plp.config
		if pl.securitree.autostart then
			require('securitree.queries').run_queries()
		end
	end,
}
