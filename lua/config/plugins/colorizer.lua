-- syntax highlight for colorcodes
-- not active by default (-> command)

return {
	'norcalli/nvim-colorizer.lua',
	cmd = 'ColorizerToggle',
	config = function() require('colorizer').setup() end,
}
