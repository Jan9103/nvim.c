-- luacheck: globals vim
local nlspsettings = require'nlspsettings'
local lspconfig = require'lspconfig'
local cmp_lsp = require'cmp_nvim_lsp'

nlspsettings.setup({
	config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
	local_settings_dir = ".nlsp-settings",
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
--lspconfig.sumneko_lua.setup{}
lspconfig.bashls.setup{cmd={'bash-language-server', 'start'}}
lspconfig.clangd.setup{}
lspconfig.cssls.setup{}
lspconfig.dockerls.setup{}
lspconfig.esbonio.setup{}
lspconfig.eslint.setup{}
lspconfig.html.setup{}
lspconfig.jsonls.setup{}
lspconfig.pylsp.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.texlab.setup{}
lspconfig.tsserver.setup{}
lspconfig.yamlls.setup{}
