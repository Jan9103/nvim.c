local methods = require("null-ls.methods")
local helpers = require("null-ls.helpers")
local pl = require('project-lua').config

local args = {
	"--fix",
	"-e",
	"-n",
}

if not pl.python.ruff.pyproject then
	for _, i in ipairs({
		"--line-length", pl.python.max_line_length,
		"--max-complexity", "139",
		"--stdin-filename", "$FILENAME",
	}) do
		table.insert(args, i)
	end
end

table.insert(args, '-')

return helpers.make_builtin({
	name = "ruff",
	meta = {
		url = "https://github.com/charliermarsh/ruff/",
		description = "An extremely fast Python linter, written in Rust.",
	},
	method = methods.internal.FORMATTING,
	filetypes = { "python" },
	generator_opts = {
		command = "ruff",
		args = args,
		to_stdin = true
	},
	factory = helpers.formatter_factory
})
