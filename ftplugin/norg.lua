-- luacheck: globals vim
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.api.nvim_set_keymap('n', 'q', ':bw<CR>', {noremap = true, silent = true,})
