-- bionic-reading tool (grays out parts of words)

-- luacheck: globals vim
return {
	'nullchilly/fsread.nvim',
	cmd = {'FSRead', "FSToggle"},
	config = function()
		-- percent of word grayed out (default=7)
		vim.g.flow_strength = 0.6
	end,
}
