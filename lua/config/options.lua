-- luacheck: globals vim

local terminal = vim.o.term

--- indent ---
local indent = 2
vim.opt.shiftwidth = indent
vim.opt.softtabstop = 0
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.copyindent = true
vim.opt.preserveindent = true
vim.opt.autoindent = true
vim.opt.smartindent = true

--- fix stuff ---
vim.opt.encoding = "utf8"
vim.opt.mouse = ""
vim.opt.backspace = "eol,start,indent"  -- fix backspace for some devices
vim.opt.wrap = true

--- silence ---
vim.opt.errorbells = false
vim.opt.visualbell = false

--- design ---
if terminal == "xterm-kitty" then
	vim.opt.termguicolors = true
end
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.laststatus = 0 -- 2
vim.o.background = "dark"

--- default settings ---
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99

--- search ---
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

--- wildmenu ---
vim.opt.wildmode = 'longest,list,full'
vim.opt.wildmenu = true

--- movement ---
-- $l -> next line char 0
--vim.opt.whichwrap:append({'<', '>', '[', ']'})
vim.cmd([[
	set whichwrap+=<,>,[,]
]])
