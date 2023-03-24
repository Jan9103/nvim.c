-- i just merge all ftdetects, since its more efficent
-- to just load the first line / filename / … once

-- luacheck: globals vim

local function by_filename()
	local filename = vim.fn.expand("%")
	if filename:match('[.]nu$') then
		vim.bo.filetype = "nu"; return 0
	end
	if filename:match('[.]nuon$') then
		vim.bo.filetype = "nu"; return 0
	end
	return 1
end

local function by_content()
	local line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1] or ""
	if line:match("^#!.* python3?$") then
		vim.bo.filetype = "python"; return
	end
end

vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		if by_filename() ~= 0 then by_content() end
	end,
})

vim.api.nvim_create_autocmd("BufNewFile", {
	callback = function()
		by_filename()
	end,
})
