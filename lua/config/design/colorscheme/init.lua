-- luacheck: globals vim
local d = require('config.design.config')
local g = vim.g
local nvim_set_hl = vim.api.nvim_set_hl

if g.colors_name then
	vim.cmd('hi clear')
end
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.o.termguicolors = true
g.colors_name = 'mytheme'

g.terminal_color_0 = d.c.black
g.terminal_color_1 = d.c.red
g.terminal_color_2 = d.c.green
g.terminal_color_3 = d.c.yellow
g.terminal_color_4 = d.c.purple
g.terminal_color_5 = d.c.pink
g.terminal_color_6 = d.c.cyan
g.terminal_color_7 = d.c.white
g.terminal_color_8 = d.c.gray
g.terminal_color_9 = d.c.bright_red
g.terminal_color_10 = d.c.bright_green
g.terminal_color_11 = d.c.bright_yellow
g.terminal_color_12 = d.c.bright_blue
g.terminal_color_13 = d.c.bright_magenta
g.terminal_color_14 = d.c.bright_cyan
g.terminal_color_15 = d.c.bright_white
g.terminal_color_background = d.c.bg
g.terminal_color_foreground = d.c.fg

local groups = require("config.design.colorscheme.groups")

for group, setting in pairs(groups) do
	nvim_set_hl(0, group, setting)
end
