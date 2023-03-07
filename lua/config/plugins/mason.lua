-- packagemanager for language-server, linter, etc

------------- MASON LSPCONFIG --------------
--local mason_lspconfig = {
--	'williamboman/mason-lspconfig.nvim',
--}
--function mason_lspconfig.config()
--	require('mason-lspconfig').setup({
--		automatic_installation = false,
--	})
--end

------------- MASON NULL-LS --------------
--local mason_null_ls = {
--	'jayp0521/mason-null-ls.nvim',
--}
--function mason_null_ls.config()
--	require("mason-null-ls").setup({
--		automatic_installation = false,
--	})
--end

--------------- MASON ---------------

local M = {
	'williamboman/mason.nvim',
	cmd = 'Mason',
}

local tools_by_ft = {
	bash = {'shellcheck', 'bash-language-server'},
	css = {'css-lsp'},
	json = {'json-lsp'},
	lua = {'luacheck'},
	sh = {'shellcheck'},
	yaml = {'yamllint'},
}

function M.check()
	local mr = require('mason-registry')
	local tools = tools_by_ft[vim.bo.ft] or {}
	for _, tool in ipairs(tools) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end

function M.config()
	require('mason').setup({
		ui = {
			check_outdated_packages_on_open = false,
			border = 'rounded',
		},
	})
	--M.check()
end

return M
