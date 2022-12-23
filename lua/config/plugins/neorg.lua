-- orgmode (journal, notes, todo lists, etc)

-- default keybinds: https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua

local M = {
	'nvim-neorg/neorg',
	tag = '*', --'0.0.15',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope.nvim',
		'hrsh7th/nvim-cmp',
		'nvim-neorg/neorg-telescope',
		{'folke/zen-mode.nvim',
			config = function() require'zen-mode'.setup() end,
		},
	},
	cmd = {'Neorg', 'NeorgStart'},
	ft = 'norg',
}

function M.config()
	require('neorg').setup {
		load = {  -- https://github.com/nvim-neorg/neorg#core-modules
			["core.defaults"] = {},
			["core.norg.dirman"] = {config = {
				workspaces = {
					home = '~/neorg/spaces/home',
					work = "~/neorg/spaces/work",
				},
				open_last_workspace = true,
			}},
			['core.integrations.nvim-cmp'] = {config = {}},
			['core.norg.completion'] = {config = {
				engine = 'nvim-cmp',
			}},
			["core.norg.concealer"] = {config = {
				conceal = 'false',  -- If `true` will conceal the `@code` and `@end` portion of the code block.
				icons = {
					todo = {
						undone = {
							icon = " ",
						},
					},
				},
			}},
			["core.norg.journal"] = {},
			['core.presenter'] = {config = {zen_mode = 'zen-mode'}},
			['core.queries.native'] = {},
			["core.ui"] = {},
			["core.keybinds"] = {},
			["core.integrations.telescope"] = {},
			["core.export"] = {},
			["core.export.markdown"] = {},
		}
	}
end

return M
