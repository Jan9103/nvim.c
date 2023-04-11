-- luacheck: globals vim

local augroup = vim.api.nvim_create_augroup('CSV_FT_AU', {})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.cmd("2,$sor i")
	end,
	group = augroup,
})
