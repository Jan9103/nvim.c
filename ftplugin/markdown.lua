-- luacheck: globals vim
vim.opt.cole = 2
vim.opt.spell = true

-- ? surrounds the current word with **
vim.api.nvim_set_keymap('n', '?', 'bi**<esc>lWhi**<esc>', {noremap = true, silent = true})

vim.g.vim_markdown_conceal_code_blocks = 0
vim.g.vim_markdown_conceal = 1
vim.g.markdown_minlines = 100 -- fix codeblock syntax highlight bugs
vim.g.vim_markdown_strikethrough = 1

vim.g.markdown_fenced_languages = {'sh', 'python', 'toml', 'bash'}
