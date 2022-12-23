-- highlight which lines have changed, toggle staging, etc
-- command: Gitsigns

local M = {
	'lewis6991/gitsigns.nvim',
	cmd = 'Gitsigns',
}

function M.config()
	require('gitsigns').setup({
		signcolumn = false,  -- we load it on `toggle` command -> dont want to deactive on toggle
	})
end

return M
