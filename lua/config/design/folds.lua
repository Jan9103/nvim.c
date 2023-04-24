-- luacheck: globals vim
-- inspired by https://github.com/scottmcginness/vim-foldtext/blob/master/plugin/foldtext.vim
local M = {}

function M.foldtext()
	local foldstart = vim.v.foldstart
	local foldlength = vim.v.foldend - foldstart + 1
	local first_line = vim.fn.getline(foldstart)
	local sanitized_first_line = string.gsub(first_line, "^%s*(.*)[{[]$", "%1")

	local text = string.format(" 󰕏 [%i]: %s ", foldlength, sanitized_first_line)
	local padding, rest = math.modf((vim.api.nvim_win_get_width(0) - string.len(text) - 3) / 2)
	if rest == 0 then
		right_padding = padding
	else
		right_padding = padding + 1
	end
	return '<' .. string.rep('-', padding) .. text .. string.rep('-', right_padding) .. '>'
end

function M.setup()
	vim.opt.foldtext = 'v:lua.require("config.design.folds").foldtext()'
end

return M
