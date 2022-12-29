-- luacheck: globals vim

local M = {
	'kiyoon/treesitter-indent-object.nvim',
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
}

function M.init()
	--- quick select section ---
	-- vai: select current section (incl the opening&closing brackets)
	-- Vai: make it full lines
	vim.keymap.set({'x', 'o'}, 'ai', function()
		require('treesitter_indent_object.textobj').select_indent_outer()
	end)
	-- vii: select current section (excluding opening&closing brackets)
	-- Vii: make it full lines
	vim.keymap.set({'x', 'o'}, 'ii', function()
		require('treesitter_indent_object.textobj').select_indent_inner()
	end)
end

return M
