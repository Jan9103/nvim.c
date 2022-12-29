-- a few commands/guis for the language server

local M = {
	'glepnir/lspsaga.nvim',
	branch = 'main',
	cmd = {'Lspsaga'},
}

function M.config()
	local saga = require("lspsaga")
	local design = require('config.design')

	saga.init_lsp_saga({
		-- single, double, rounded, bold, plus
		border_style = 'single',
		-- transparency (0=none, 100=completly)
		saga_winblend = 0,
		-- Error, Warn, Info, Hint
		--diagnostic_header = { " ", " ", " ", "ﴞ " },
		diagnostic_header = { design.lsp_symbols.Error, design.lsp_symbols.Warn, design.lsp_symbols.Info, design.lsp_symbols.Hint, },
		preview_lines_above = 0,
		max_preview_lines = 10,
		code_action_icon = "💡",
		code_action_num_shortcut = true,
		code_action_lightbulb = {
			enable = true,
			enable_in_insert = true,
			cache_code_action = true,
			sign = true,
			update_time = 150,
			sign_priority = 20,
			virtual_text = true,
		},
		finder_icons = {
			def = '  ',
			ref = '諭 ',
			link = '  ',
		},
		finder_request_timeout = 1500,
		finder_action_keys = {
			open = {'o', '<CR>'},
			vsplit = 's',
			split = 'i',
			tabe = 't',
			quit = {'q', '<ESC>'},
		},
		code_action_keys = {
			quit = {'q', '<ESC>'},
			exec = '<CR>',
		},
		definition_action_keys = {
			edit = '<C-c>o',
			vsplit = '<C-c>v',
			split = '<C-c>i',
			tabe = '<C-c>t',
			quit = {'q', '<ESC>'},
		},
		rename_action_quit = '<C-c>',
		rename_in_select = true,
		symbol_in_winbar = {
			in_custom = false,
			enable = false,
			seperator = ' ',
			show_fil = true,
			file_formatter = '',
			click_support = false,
		},
		show_outline = {
			win_position = 'right',
			win_with = '',
			win_width = 30,
			auto_enter = true,
			auto_preview = true,
			virt_text = '┃',
			jump_key = 'o',
			auto_refresh = true,
		},
		custom_kind = {},
		server_filetype_map = {},
	})
end

return M
