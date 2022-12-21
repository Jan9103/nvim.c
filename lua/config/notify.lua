-- luacheck: globals vim
local notify = require("notify")

vim.notify = notify

notify.setup({
	background_colour = "#000000",
	stages = "slide",
})
