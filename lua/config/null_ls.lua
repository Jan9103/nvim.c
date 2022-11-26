local null_ls = require('null-ls')
-- local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

--require("null-ls").setup({
--	sources = {
--		--require("null-ls").builtins.formatting.stylua,
--		--require("null-ls").builtins.diagnostics.eslint,
--		require("null-ls").builtins.completion.spell,
--	},
--})

null_ls.setup({
	debug = true,
	sources = {
		--null_ls.builtins.diagnostics.mypy,  -- not working for some reason
		--null_ls.builtins.diagnostics.vale,
	},
	-- on_attach = function(client, buffer)
	-- 	if client.server_capabilities.documentFormattingProvider then
	-- 		vim.api.nvim_clear_autocmds { buffer = 0, group = augroup_format }
	-- 		vim.api.nvim_create_autocmd("BufWritePre", {
	-- 			group = augroup_format,
	-- 			buffer = 0,
	-- 			callback = function() vim.lsp.buf.formatting_seq_sync() end
	-- 		})
	-- 	end
	-- end,
})
