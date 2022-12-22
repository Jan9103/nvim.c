local M = {
	'MattesGroeger/vim-bookmarks',
	lazy = false,
	keys = {
		'mm', -- toggle bookmark
		'mi', -- add/edit/remove line annotation
		'mn', 'mp', -- jump between
	},
	cmd = {
		'BookmarkToggle',
		'BookmarkAnnotate',
		'BookmarkNext',
		'BookmarkPrev',
		'BookmarkShowAll',
		'BookmarkClear',
		'BookmarkClearAll',
		'BookmarkMoveUp',
		'BookmarkMoveDown',
		'BookmarkMoveToLine',
		'BookmarkSave',
		'BookmarkLoad',
	},
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
