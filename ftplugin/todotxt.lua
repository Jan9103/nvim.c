-- luacheck: globals vim

local augroup = vim.api.nvim_create_augroup('TODOTXT_FT_AU', {})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.cmd("sor i")
	end,
	group = augroup,
})
