-- display pressed keys on screen

local M = {
	'tamton-aquib/keys.nvim',
	cmd = 'KeysToggle',
}

function M.config()
	require("keys").setup({
		enable_on_startup = false,
		win_opts = {
			border='rounded', -- 'shadow'
			width=25,
			height=3,
		}
	})
end

return M
