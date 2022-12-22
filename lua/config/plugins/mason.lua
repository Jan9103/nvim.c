------------- MASON LSPCONFIG --------------
local mason_lspconfig = {
	'williamboman/mason-lspconfig.nvim',
}
function mason_lspconfig.config()
	require('mason-lspconfig').setup({
		automatic_installation = true,
	})
end

------------- MASON NULL-LS --------------
local mason_null_ls = {
	'jayp0521/mason-null-ls.nvim',
}
function mason_null_ls.config()
	require("mason-null-ls").setup({
		automatic_installation = true,
	})
end

--------------- MASON ---------------

local M = {
	'williamboman/mason.nvim',
	dependencies = {
		mason_lspconfig,
		mason_null_ls,
	},
}

M.tools = {
	'luacheck',
	'shellcheck',
	'flake8',
}

function M.check()
	local mr = require('mason-registry')
	for _, tool in ipairs(M.tools) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end

function M.config()
	require('mason').setup()
	M.check()
end

return M
