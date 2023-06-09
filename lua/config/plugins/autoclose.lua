local M = {
	--enabled = false,
	'altermo/ultimate-autopair.nvim',
	branch = 'v0.4.0',
	event = {'InsertEnter', 'CmdlineEnter'},
}

function M.config()
	local ap = require('ultimate-autopair')
	ap.setup()
	-- ap.setup({
	-- 	cmap = true,
	-- 	bs = {
	-- 		enable = true,
	-- 		overjump = true,
	-- 		space = true,
	-- 		multichar = true,
	-- 		fallback = nil,
	-- 	},
	-- 	cr = {
	-- 		enable = true,
	-- 		autoclose = false,
	-- 		multichar = {
	-- 			enable = true,
	-- 			markdown = {{'```', '```', pair = true, noalpha = true, next = true}},
	-- 		},
	-- 		addsemi = {'c', 'cpp', 'rust'},
	-- 		fallback = nil,
	-- 	},
	-- 	space = {
	-- 		enable = true,
	-- 		fallback = nil,
	-- 	},
	-- 	fastwarp = {
	-- 		enable = false,
	-- 	},
	-- 	--fastend = {
	-- 	--	enable = false,
	-- 	--},
	-- })
end

return M
