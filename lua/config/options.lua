-- luacheck: globals vim

if vim.env.DISPLAY ~= nil then
	-- use system clipboard
	-- https://vim.fandom.com/wiki/Accessing_the_system_clipboard
	vim.o.clipboard="unnamedplus"
end


vim.opt.foldlevel = 99

vim.opt.encoding = "utf8"
vim.opt.mouse = "nv" --"a"
vim.opt.backspace = "eol,start,indent"
vim.opt.wrap = true

vim.opt.errorbells = false
vim.opt.visualbell = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars = {
	tab = '› ',
	lead = '·',
	trail = '·',
}
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
