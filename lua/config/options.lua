-- luacheck: globals vim

local terminal = vim.o.term

vim.opt.foldlevel = 99

vim.opt.encoding = "utf8"
vim.opt.mouse = "nv" --"a"
vim.opt.backspace = "eol,start,indent"
vim.opt.wrap = true

vim.opt.errorbells = false
vim.opt.visualbell = false

if terminal == "xterm-kitty" then
	vim.opt.termguicolors = true
end
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.o.background = "dark"

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- $l -> next line char 0
--vim.opt.whichwrap:append({'<', '>', '[', ']'})
vim.cmd([[
	set whichwrap+=<,>,[,]
]])
