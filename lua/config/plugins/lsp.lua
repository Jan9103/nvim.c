-- language server setup

-- luacheck: globals vim

local M = {
	'tamago324/nlsp-settings.nvim',
	event = "BufReadPre",
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		'neovim/nvim-lspconfig',
	},
}

function M.config()
	require('mason-lspconfig')

	local nlspsettings = require'nlspsettings'
	local lspconfig = require'lspconfig'
	local cmp_lsp = require'cmp_nvim_lsp'

	nlspsettings.setup({
		config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
		local_settings_dir = '.nlsp-settings',
		local_settings_root_markers_fallback = { '.git' },
		append_default_schemas = true,
		loader = 'json',
	})

	local capabilities = cmp_lsp.default_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true


	lspconfig.util.default_config = vim.tbl_extend('force', lspconfig.util.default_config, {
		capabilities = capabilities,
	})

	-------- Server -------
	lspconfig.bashls.setup{} -- {cmd={'bash-language-server', 'start'}}
	--lspconfig.nil_ls.setup{}  -- nix
	--lspconfig.clangd.setup{}  -- c
	lspconfig.cssls.setup{}     -- css
	lspconfig.dockerls.setup{}  -- docker
	lspconfig.esbonio.setup{}   -- rst
	lspconfig.eslint.setup{}    -- javascript
	lspconfig.html.setup{}      -- html
	lspconfig.jsonls.setup{}    -- json
	lspconfig.pylsp.setup{}     -- python
	lspconfig.rust_analyzer.setup{} -- rust
	lspconfig.texlab.setup{}    -- latex
	lspconfig.tsserver.setup{}  -- typescript


	require('config.plugins.null-ls').setup{}
end

return M
