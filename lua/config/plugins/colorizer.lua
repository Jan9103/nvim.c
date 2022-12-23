-- syntax highlight for colorcodes
-- not active by default (-> command)

local M = {
	'norcalli/nvim-colorizer.lua',
	cmd = {
		'ColorizerAttachToBuffer',
		'ColorizerToggle',
	},
}

function M.config()
	require'colorizer'.setup()
end

return M
