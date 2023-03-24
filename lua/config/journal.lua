-- luacheck: globals vim

local function parse_date(str)
	local year, month, day = str:match("(%d+)-(%d+)-(%d+)")
	local date = {
		year = year,
		month = month,
		day = day,
	}
	date.day_of_the_wek = os.date("%A", os.time(date))
	return date
end

vim.api.nvim_create_user_command(
	'Journal',
	function(opts)
		-- parse the date
		local date
		if opts.fargs[1] ~= nil then
			date = parse_date(opts.fargs[1])
		else
			local year, month, day, dotw = os.date("%Y-%m-%d-%A"):match("(%d+)-(%d+)-(%d+)-(.+)")
			date = {
				year = year,
				month = month,
				day = day,
				day_of_the_wek = dotw,
			}
		end
		local formatted_date = date.year .. "-" .. date.month .. "-" .. date.day

		-- create dirs
		local path = vim.loop.os_homedir() .. "/journal"
		if not vim.loop.fs_stat(path) then vim.loop.fs_mkdir(path, 448) end
		path = path .. "/" .. date.year
		if not vim.loop.fs_stat(path) then vim.loop.fs_mkdir(path, 448) end
		path = path .. "/" .. date.month
		if not vim.loop.fs_stat(path) then vim.loop.fs_mkdir(path, 448) end

		path = path .. "/" .. date.day .. ".md"
		if vim.loop.fs_stat(path) then
			vim.cmd.edit(path) return
		else
			local b = vim.api.nvim_create_buf(true, false)
			--vim.api.nvim_buf_set_name(b, formatted_date)
			vim.api.nvim_buf_set_name(b, path)
			vim.api.nvim_buf_set_lines(b, 0, 0, true, {
				"# " .. date.day_of_the_wek .. " " .. formatted_date,
				"",
				"## ",
			})
			vim.api.nvim_win_set_buf(0, b)
			vim.opt.filetype = "markdown"
		end
	end,
	{nargs = "?"}
)
