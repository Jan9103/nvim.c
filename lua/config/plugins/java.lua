-- luacheck: globals vim
local M = {
	'mfussenegger/nvim-jdtls',
	ft = 'java',
}

function M.config()
	require('jdtls').start_or_attach({
		cmd = {
			vim.fn.stdpath('data') .. '/mason/bin/jdtls',
		},
		root_dir = vim.fs.dirname(vim.fs.find(
			{'.gradlew', '.git', 'mvnw'},
			{ upward = true }
		)[1]),
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
