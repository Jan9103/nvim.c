-- https://github.com/nvim-neotest/neotest-python

local M = {
	dependency = {
		'nvim-neotest/neotest-python',
		--build = ':TSInstall python',
	}
}

function M.adapter()
	return require("neotest-python")({
		--args = {"--log-level", "DEBUG"},
		runner = "pytest",
		-- python = ".venv/bin/python",
		-- is_test_file = function(file_path) return true end,
	})
end

return M
