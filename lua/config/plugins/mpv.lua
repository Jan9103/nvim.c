-- a music playes based on mpv

-- luacheck: globals vim

local M = {
	'tamton-aquib/mpv.nvim',
	cmd = 'MpvToggle',
}

function M.config()
	require('mpv').setup({
		border = 'rounded',
	})
end

return M
