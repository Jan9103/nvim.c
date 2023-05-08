-- luacheck: globals vim

-- inspiration: https://github.com/vigoux/notifier.nvim

local M = {}

local y_offset = 0
local notification_count = 0
local message_log = {}

local function popup(text, display_time_ms)
	local bufnr = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, text)

	local text_width = 1
	for linenr = 1, #text do
		if text_width < #text[linenr] then
			text_width = #text[linenr]
		end
	end

	local win_id = vim.api.nvim_open_win(bufnr, false, {
		border = 'rounded',
		row = vim.o.lines - #text - 4 - y_offset,
		col = vim.o.columns - text_width - 3,
		relative = 'editor',
		style = 'minimal',
		width = text_width,
		height = #text,
		focusable = false,
	})
	y_offset = y_offset + #text + 2
	notification_count = notification_count + 1

	local timer = vim.loop.new_timer()
	timer:start(display_time_ms, 0, vim.schedule_wrap(function()
		vim.api.nvim_win_close(win_id, true)
		notification_count = notification_count - 1
		if notification_count == 0 then
			y_offset = 0
		end
	end))
end

function M.notify(msg, _log_level, _opts)
	-- TODO: color highlight log levels
	-- log_level: :h vim.log.levels

	local time_to_read = 2500 + (#msg * 60)
	if time_to_read > 15000 then time_to_read = 15000 end -- 15sec
	msg = vim.split(msg, "\n")

	for i=1,#msg do
		message_log[#message_log+1] = msg[i]
	end
	message_log[#message_log+1] = '<===LOG=SEPERATOR===>'

	popup(msg, time_to_read)
end

function M.setup()
	vim.notify = M.notify

	vim.api.nvim_create_user_command(
		'Notifications',
		function(_opts)
			local bufnr = vim.api.nvim_create_buf(false, true)
			vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, message_log)

			vim.api.nvim_open_win(bufnr, true, {
				border = 'rounded',
				relative = 'editor',
				style = 'minimal',
				row = 1,
				col = 1,
				width = vim.o.columns - 4,
				height = vim.o.lines - 4,
				focusable = true,
				title = 'Notification Log',
				title_pos = 'center',
			})
		end,
		{}
	)
end

return M
