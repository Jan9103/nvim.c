-- luacheck: globals vim
-- modified version of the official one (in order to allow more customization)

local pl = require('project-lua').config

local pattern = '([^:]+):(%d+):(%d+): (%a+): (.*)'
local groups = { 'file', 'lnum', 'col', 'severity', 'message' }
local severities = {
  error = vim.diagnostic.severity.ERROR,
  warning = vim.diagnostic.severity.WARN,
  note = vim.diagnostic.severity.HINT,
}

local args = {
    '--show-column-numbers',
    '--hide-error-codes',
    '--hide-error-context',
    '--no-color-output',
    '--no-error-summary',
    '--no-pretty',
}
if pl.python.mypy.ignore_missing_imports then
  table.insert(args, '--ignore-missing-imports')
end
if pl.python.mypy.strict then
  table.insert(args, '--strict')
end

return {
  cmd = 'mypy',
  stdin = false,
  ignore_exitcode = true,
  args = args,
  parser = require('lint.parser').from_pattern(pattern, groups, severities, { ['source'] = 'mypy' }),
}
