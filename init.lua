-- luacheck: globals vim
vim.keymap.set('n', 'f', '')
vim.keymap.set('n', 'F', '')

require('config.lazy')  -- since lazy applies lua caching run it first
require('config.design').setup()
require('config.options')
require('config.keybinds')
require('config.journal')
