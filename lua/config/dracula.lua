local hasDracula, dracula = pcall(require, 'dracula')
if not dracula then
	return nil
end
--local dracula = require("dracula")
local c = {
	bg = "#282A36",
	fg = "#F8F8F2",
	selection = "#44475A",
	comment = "#7f94d5", --"#bd93f9", -- "#6272A4",
	red = "#FF5555",
	orange = "#FFB86C",
	yellow = "#F1FA8C",
	green = "#50fa7b",
	purple = "#BD93F9",
	cyan = "#8BE9FD",
	pink = "#FF79C6",
	bright_red = "#FF6E6E",
	bright_green = "#69FF94",
	bright_yellow = "#FFFFA5",
	bright_blue = "#D6ACFF",
	bright_magenta = "#FF92DF",
	bright_cyan = "#A4FFFF",
	bright_white = "#FFFFFF",
	menu = "#21222C",
	visual = "#3E4452",
	gutter_fg = "#4B5263",
	nontext = "#3B4048",
}

if dracula.setup == nil then
	return nil
end

dracula.setup({
	-- customize dracula color palette
	colors =c,


	-- show the '~' characters after the end of buffers
	show_end_of_buffer = true,
	-- use transparent background
	transparent_bg = true,
	-- set custom lualine background color
	lualine_bg_color = c.selection,
	-- set italic comment
	italic_comment = true,

	overrides = {
		CmpItemKindField =       { fg = c.bg, bg = c.orange },
		CmpItemKindProperty =    { fg = c.bg, bg = c.fg },
		CmpItemKindEvent =       { fg = c.bg, bg = c.purple },

		CmpItemKindText =        { fg = c.bg, bg = c.orange },
		CmpItemKindEnum =        { fg = c.bg, bg = c.orange },
		CmpItemKindKeyword =     { fg = c.bg, bg = c.pink },

		CmpItemKindConstant =    { fg = c.bg, bg = c.purple },
		CmpItemKindConstructor = { fg = c.bg, bg = c.cyan },
		CmpItemKindReference =   { fg = c.bg, bg = c.orange },

		CmpItemKindFunction =    { fg = c.bg, bg = c.green },
		CmpItemKindStruct =      { fg = c.bg, bg = c.purple },
		CmpItemKindClass =       { fg = c.bg, bg = c.bright_cyan },
		CmpItemKindModule =      { fg = c.bg, bg = c.orange },
		CmpItemKindOperator =    { fg = c.bg, bg = c.pink },

		CmpItemKindVariable =    { fg = c.bg, bg = c.fg },
		CmpItemKindFile =        { fg = c.bg, bg = c.yellow },

		CmpItemKindUnit =        { fg = c.bg, bg = c.orange },
		CmpItemKindSnippet =     { fg = c.bg, bg = c.orange },
		CmpItemKindFolder =      { fg = c.bg, bg = c.yellow },

		CmpItemKindMethod =      { fg = c.bg, bg = c.green },
		CmpItemKindValue =       { fg = c.bg, bg = c.orange },
		CmpItemKindEnumMember =  { fg = c.bg, bg = c.orange },

		CmpItemKindInterface =   { fg = c.bg, bg = c.bright_cyan },
		-- CmpItemKindColor =       { fg = c.bg, bg = c }, -- linked to cssColor
		CmpItemKindTypeParameter={ fg = c.bg, bg = c.orange },
	},
})
