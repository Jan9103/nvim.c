-- luacheck: globals vim
--vim.keymap.set('n', 'f', '')
--vim.keymap.set('n', 'F', '')
vim.g.mapleader = 'f'

require('config.lazy')  -- since lazy applies lua caching run it first
require('config.design').setup()
require('config.options')
require('config.keybinds')
require('config.journal')
