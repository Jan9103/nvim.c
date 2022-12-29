-- luacheck: globals vim

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'fh', vim.lsp.buf.hover)
vim.keymap.set('n', 'fN', vim.diagnostic.goto_prev)
vim.keymap.set('n', 'fn', vim.diagnostic.goto_next)
vim.keymap.set('n', 'fl', vim.diagnostic.setloclist)
