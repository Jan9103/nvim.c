-- luacheck: globals vim
vim.keymap.set('n', 'f', '')
vim.keymap.set('n', 'F', '')

require('init')
require('config.lazy')
require('config.options')
require('config.keybinds')
require('config.statusline').setup()
require('config.journal')
