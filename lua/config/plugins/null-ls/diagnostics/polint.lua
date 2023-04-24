-- luacheck: globals vim

local methods = require("null-ls.methods")

local polint = {
	method = methods.internal.DIAGNOSTICS,
	filetypes = {"po"},
	generator = {},
}

function polint.generator.fn(params)
	vim.notify('POLINT')
	local diagnostics = {}
	local prev_line = 'zzzzzzzzz'
	for line_index, line in ipairs(params.content) do
		if line == "#, fuzzy" then
			table.insert(diagnostics, {
				row = line_index,
				col = 1,
				end_col = 9,
				source = "polint",
				message = "fuzzy match",
				severity = vim.diagnostic.severity.WARN,
			})
		elseif line == "" then
			if prev_line == 'msgstr ""' then
				table.insert(diagnostics, {
					row = line_index - 1,
					col = 1,
					end_col = 10,
					source = "polint",
					message = "empty translation",
					severity = vim.diagnostic.severity.WARN,
				})
			end
		end
		prev_line = line
	end
	return diagnostics
end

return polint
