-- luacheck: globals vim
vim.opt.cole = 2
vim.opt.spell = true

-- ? surrounds the current word with **
vim.api.nvim_set_keymap('n', '?', 'bi**<esc>lWhi**<esc>', {noremap = true, silent = true})

vim.g.markdown_fenced_languages = {'sh', 'python', 'toml', 'bash', 'rust', 'yaml'}
