-- cross file bookmarks & line-notes

-- luacheck: globals vim

local M = {
	enabled = false,
	'MattesGroeger/vim-bookmarks',
	event = 'VeryLazy', -- in order to load bookmarks it has to be
	dependencies = {
		{'tom-anders/telescope-vim-bookmarks.nvim', cmd = 'Telescope'},
	},
}

function M.config()
	vim.g.bookmark_highlight_lines = 1
	vim.cmd([[
		hi BookmarkSign guifg=#BD93F9
	]])
end

return M
