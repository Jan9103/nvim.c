-- scan for common security vulnurabilities

local M = {
	"GeekMasher/securitree.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/playground",
	},
	cmd = {
		"SecuriTree",
		"SecuriTreeToggle",
	},
}

function M.config()
	local pl = require('project-lua').config
	local st = require('securitree')

	st.setup({
		-- since we only load the plugin on command its fine
		autocmd = pl.securitree.autocmd,  -- BufWritePre & BufEnter
		paths = {
			vim.fn.stdpath('config') .. '/securitree-queries'
		}
	})
end

return M
