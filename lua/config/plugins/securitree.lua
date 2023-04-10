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
	require("securitree").setup({
		-- since we only load the plugin on command its fine
		autocmd = true,  -- BufWritePre & BufEnter
	})
end

return M
