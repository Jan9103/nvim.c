-- luacheck: globals vim
local M = {
	'mfussenegger/nvim-jdtls',
	ft = 'java',
}

function M.config()
	local base_dir = vim.fs.dirname(vim.fs.find(
		{'.git', 'mvnw', 'build.gradle'},
		{ upward = true }
	)[1])

	require('jdtls').start_or_attach({
		cmd = {
			"/usr/bin/env",
			"PWD=" .. base_dir,
			vim.fn.stdpath('data') .. '/mason/bin/jdtls',
		},
		root_dir = base_dir,
		settings = {
			completion = {
				filteredTypes = {
					"com.sun.*",
					"io.micrometer.shaded.*",
					"java.awt.*",
					"jdk.*",
					"sun.*",
				},
			},
		},
	})
end

return M
