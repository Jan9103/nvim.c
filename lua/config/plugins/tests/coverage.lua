-- show code coverage in the sign column

local M = {
	'andythigpen/nvim-coverage',
	cmd = 'Coverage'
}

function M.config()
	require("coverage").setup({
		commands = true,
	})
end

return M
