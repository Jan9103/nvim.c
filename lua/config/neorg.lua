-- default keybinds: https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
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
		["core.norg.journal"] = {config = {}},
		['core.presenter'] = {config = {zen_mode = 'zen-mode'}},
		['core.queries.native'] = {config = {}},
		["core.ui"] = {config = {}},
		["core.keybinds"] = {config = {
			--default_keybinds = false,
			--hook = function(keybinds)
			--end,
		}},
		["core.integrations.telescope"] = {},
		["core.export"] = {},
		["core.export.markdown"] = {},
	}
}
