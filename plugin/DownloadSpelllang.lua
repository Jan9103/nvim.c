-- luacheck: globals vim

vim.api.nvim_create_user_command(
	'DownloadSpellLang',
	function()
		-- TODO: check if spelllang is set
		local website = "https://ftp.pl.vim.org/pub/vim/runtime/spell/"
		local dir = vim.fn.stdpath("config") .. "/spell/"
		local file = vim.o.spelllang .. ".utf-8.spl"
		vim.notify("Attempting to download " .. file)
		require('plenary.curl').get(website .. file, {
			output = dir .. file,
			callback = function(out)
				if out.status == 200 then
					vim.notify("Downloaded " .. file)
				else
					vim.notify("Failed to download " .. file .. "(http code " .. out.status .. ")")
				end
			end,
		})
	end,
	{}
)
