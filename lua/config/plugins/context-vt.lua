-- display what is beeing closed
-- class foo {
--   print("")
-- } --> class foo {

local M = {
	'haringsrob/nvim_context_vt',
	--cmd = 'NvimContextVtToggle',
	lazy = false,
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
}

function M.config()
	require('nvim_context_vt').setup({
		enabled = true,
		prefix = '',
		disable_ft = {
			'markdown',
		},
		disable_virtual_lines = false, -- disable for indentation based blocks (python)
		disable_virtual_lines_ft = {
			'yaml',
		},
		min_rows = 3,
	})
end

return M
