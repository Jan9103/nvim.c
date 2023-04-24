-- luacheck: globals vim
local design = require('config.design.config')
local mode_colors = {
	c = design.c.orange,
	i = design.c.green,
	ic = design.c.green,
	n = design.c.purple,
	R = design.c.red,
	r = design.c.red,
	s = design.c.green,
	S = design.c.green,
	t = design.c.orange,
	V = design.c.yellow,
	v = design.c.yellow,
}
local bg = design.c.menu

local is_loaded
local M = {}

local function apply_to_win()
	for _, win in pairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_get_current_win() == win then
			vim.wo[win].statusline = '%!v:lua.require\'config.design.statusline\'.active_statusline()'
		elseif vim.api.nvim_buf_get_name(0) ~= "" then
			vim.wo[win].statusline = '%!v:lua.require\'config.design.statusline\'.inactive_statusline()'
		end
	end
end

function M.setup()
	if is_loaded then return else is_loaded = true end

	vim.opt.laststatus = 2

	local augroup = vim.api.nvim_create_augroup('STATUSLINE_AU', {})
	vim.api.nvim_create_autocmd(
		{'BufEnter', 'BufReadPost', 'ColorScheme', 'TabEnter', 'TabClosed'},
		{callback=apply_to_win, group=augroup}
	)
end

local function get_diagnostics()
	local lsp_details = ""
	for type, sign in pairs(design.lsp_symbols) do
		local count = #vim.diagnostic.get(0, {severity=type})
		local number = count > 0 and sign..count.." " or ""
		lsp_details = lsp_details..number
	end
	return lsp_details
end

function M.inactive_statusline()
	local fg = design.c.comment
	vim.api.nvim_set_hl(0, "StatuslineNorm", {fg=fg, bg=bg})
	vim.api.nvim_set_hl(0, "StatuslineInv", {fg=bg, bg=fg})

	return "%#StatuslineNorm#%=%#StatuslineInv#%t%#StatuslineNorm#%="
end

function M.active_statusline()
	local fg = mode_colors[vim.api.nvim_get_mode()['mode']] or design.c.red
	vim.api.nvim_set_hl(0, "StatuslineNorm", {fg=fg, bg=bg})
	vim.api.nvim_set_hl(0, "StatuslineInv", {fg=bg, bg=fg})

	-- required variables
	local f_name = '%t'
	local edited = vim.bo.mod and " " or ""
	local readonly = vim.bo.readonly and " " or ""
	local ft_icon = design.file_icons[vim.bo.filetype] or ''

	return "%#StatuslineInv#"
		.. get_diagnostics()
		.. "%#StatuslineNorm#%="
		.. " " .. f_name .. edited .. readonly .. " "
		.. "%=%#StatuslineInv#"
		.. ft_icon .. vim.bo.filetype
end

return M
