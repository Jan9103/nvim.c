-- language server setup

-- luacheck: globals vim

local M = {
	'neovim/nvim-lspconfig',
	--event = "BufReadPre",
	lazy = false,
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
	},
}

function M.config()
	require('mason-lspconfig')

	local lspc = require'lspconfig'
	local cmp_lsp = require'cmp_nvim_lsp'

	local capabilities = cmp_lsp.default_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true


	lspc.util.default_config = vim.tbl_extend('force', lspc.util.default_config, {
		capabilities = capabilities,
	})

	-------- Server -------
	lspc.bashls.setup{} -- {cmd={'bash-language-server', 'start'}}
	lspc.nil_ls.setup{}  -- nix
	--lspcclangd.setup{}  -- c
	lspc.cssls.setup{}     -- css
	lspc.dockerls.setup{}  -- docker
	lspc.esbonio.setup{}   -- rst
	lspc.eslint.setup{}    -- javascript
	lspc.html.setup{}      -- html
	lspc.jsonls.setup{}    -- json
	lspc.pylsp.setup{
		settings = {pylsp = {plugins = {
			flake8 = {enabled = false},
			mccabe = {enabled = false},
			pycodestyle = {enabled = false},
			pydocstyle = {enabled = false},
			pyflakes = {enabled = false},
			pylint = {enabled = false, live_mode = true, strict = false},
			pylsp_mypy = {enabled = false},
			rope_completion = {enabled = false},
			ruff = {enabled = false},
		}}}
	}
	lspc.texlab.setup{}    -- latex
	lspc.tsserver.setup{}  -- typescript


	require('config.plugins.null-ls').setup({})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
	vim.keymap.set('n', 'fh', vim.lsp.buf.hover)
	vim.keymap.set('n', 'fN', vim.diagnostic.goto_prev)
	vim.keymap.set('n', 'fn', vim.diagnostic.goto_next)
	vim.keymap.set('n', 'fl', vim.diagnostic.setloclist)
end

return M
