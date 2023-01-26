-- luacheck: globals vim

local M = {
	'simrat39/rust-tools.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'mfussenegger/nvim-dap',
		'simrat39/inlay-hints.nvim',
	},
	ft = 'rust',
}

function M.config()
	local ih = require("inlay-hints")

	ih.setup({only_current_line = false,})

	local lspconfig = require'lspconfig'
	local cmp_lsp = require'cmp_nvim_lsp'
	local capabilities = cmp_lsp.default_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	local lsp_config = vim.tbl_extend('force', lspconfig.util.default_config, {
		capabilities = capabilities,
		on_attach = function(c, b)
			ih.on_attach(c, b)

			-- from cmp
			-- https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples#rust-with-rust-toolsnvim
			vim.api.nvim_buf_set_option(b, "formatexpr", "v:lua.vim.lsp.formatexpr()")
			vim.api.nvim_buf_set_option(b, "omnifunc", "v:lua.vim.lsp.omnifunc")
			vim.api.nvim_buf_set_option(b, "tagfunc", "v:lua.vim.lsp.tagfunc")
		end,
		settings = {
			-- https://rust-analyzer.github.io/manual.html#nvim-lsp
			-- https://rust-analyzer.github.io/manual.html#configuration
			["rust-analyzer"] = {
				cargo = {
					features = 'all',
				},
				completion = {
					autoimport = {
						enabled = true,
					},
				},
				diagnostics = {
					enable = true,
					experimental = {
						enable = true,
					},
				},
			},
		},
	})

	require("rust-tools").setup({
		tools = {
			on_initialized = function()
				ih.set_all()
			end,
			inlay_hints = {
				auto = false,
			},
		},
		server = lsp_config,
	})
end

return M
