local M = {dependency = 'rouge8/neotest-rust'}

function M.adapter()
	require("neotest-rust")({
		-- args = { "--no-capture" },
	})
end

return M
