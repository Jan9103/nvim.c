-- a sidebar with fileexplorer, bookmarks, etc

-- luacheck: globals vim

local M = {
	enabled = false,
	'ldelossa/litee.nvim',
	dependencies = {
		'ldelossa/litee-calltree.nvim',
		'ldelossa/litee-symboltree.nvim',
		'ldelossa/litee-filetree.nvim',
		'ldelossa/litee-bookmarks.nvim',

		'kyazdani42/nvim-web-devicons',
	},
	cmd = 'LT',
}

function M.config()
	require('litee.lib').setup({
		tree = {
			icon_set = 'codicons',
		},
		panel = {
			orientation = 'left',
			panel_size = 30,
		},
	})

	require('litee.calltree').setup({})

	require('litee.symboltree').setup({})

	require('litee.filetree').setup({
		use_web_devicons = true,
		--icon_set_custom = {dir = "dir:"},
	})

	require('litee.bookmarks').setup({})
end

return M
