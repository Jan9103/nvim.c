local M = {
	enable = false,
	'nvim-treesitter/nvim-treesitter-context',
	lazy = false,
	dependencies = {
		'nvim-treesitter/nvim-treesitter',
	},
}

function M.config()
	require'treesitter-context'.setup{
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
		min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
		patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
			-- For all filetypes
			-- Note that setting an entry here replaces all other patterns for this entry.
			-- By setting the 'default' entry below, you can control which nodes you want to
			-- appear in the context window.
			default = {
				'class',
				'function',
				'method',
				'for',
				'while',
				'if',
				'switch',
				'case',
			},
			-- Patterns for specific filetypes
			-- If a pattern is missing, *open a PR* so everyone can benefit.
			tex = {
				'chapter',
				'section',
				'subsection',
				'subsubsection',
			},
			rust = {
				'impl_item',
				'struct',
				'enum',
			},
			scala = {
				'object_definition',
			},
			vhdl = {
				'process_statement',
				'architecture_body',
				'entity_declaration',
			},
			markdown = {
				'section',
			},
			elixir = {
				'anonymous_function',
				'arguments',
				'block',
				'do_block',
				'list',
				'map',
				'tuple',
				'quoted_content',
			},
			json = {
				'pair',
			},
			yaml = {
				'block_mapping_pair',
			},
		},
		exact_patterns = {
			-- Example for a specific filetype with Lua patterns
			-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
			-- exactly match "impl_item" only)
			-- rust = true,
		},

		-- [!] The options below are exposed but shouldn't require your attention,
		--     you can safely ignore them.

		zindex = 20, -- The Z-index of the context window
		mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
		-- Separator between context and content. Should be a single character string, like '-'.
		-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
		separator = nil,
	}

	-- vim.api.nvim_create_augroup('TSContextConfig', {
	-- 	clear=true,
	-- })
	-- vim.api.nvim_create_autocmd({'VimEnter', 'ColorScheme'}, {
	-- 	group='TSContextConfig',
	-- 	desc='Patch colorscheme.',
	-- 	callback = function()
	-- 		vim.api.nvim_set_hl(0, 'TreesitterContextBottom', {gui='underline', guisp='Grey'})
	-- 		vim.api.nvim_set_hl(0, 'TreesitterContext', {guibg='#303242'})
	-- 	end,
	-- })


	vim.cmd([[
		hi TreesitterContextBottom gui=underline guisp=Grey
		hi TreesitterContext guibg=#303242
	]])
end

return M