-- luacheck: globals vim
local function noremap(mode, bind, command)
	vim.api.nvim_set_keymap(mode, bind, command, {noremap = true, silent = true,})
end
local function map(mode, bind, command)
	vim.api.nvim_set_keymap(mode, bind, command, {noremap = false, silent = true,})
end

-------------- NORMAL MODE ------------------
--- half insert mode ---
noremap('n', ' ', 'i <Esc>l')
noremap('n', '<Return>', 'o<Esc>')
noremap('n', '<BackSpace>', 'hx')

--- delete to line begin ---
noremap('n', 'd^', 'v^x')

--- copy mode ---
noremap('n', '<F3>', ':set nornu nonu list!<CR>')
--vim.keymap.set('n', '<F2>', function() vim.opt.mouse = (vim.opt.mouse == 'a' and '' or 'a') end)

--- fastquit and custom record mode ---
noremap('n', 'q', ':q<CR>')
-- currently broken:
--noremap('n', 'T', 'q')
--noremap('n', 't', '@T')

--- move lines ---
noremap('n', '<S-up>', ':m .-2<CR>==')
noremap('n', '<S-down>', ':m .+1<CR>==')

--- diff since last write
noremap('n', 'fd', ':w !diff % -<CR>')

-- move between splits
noremap('n', '<C-left>',  '<C-w>h')
noremap('n', '<C-right>', '<C-w>l')
noremap('n', '<C-down>',  '<C-w>j')
noremap('n', '<C-up>',    '<C-w>k')
-- resize
noremap('n', '+', '<cmd>res +1<cr>')
noremap('n', '-', '<cmd>res -1<cr>')
noremap('n', 'ff', '<C-w>T')  -- move to new tab (fullscreen)

--- tab indent ---
map('n', '>>', '')
map('n', '<<', '')
noremap('n', '<Tab>', '>>')
noremap('n', '<S-Tab>', '<<')

noremap('n', 'fs', ':sor i<CR>')

-------------- INSERT MODE ------------------

-------------- VISUAL MODE ------------------
--- search selected text ---
noremap('v', '#', "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

--- tab indent ---
map('v', '>>', '')
map('v', '<<', '')
noremap('v', '<Tab>', '>><Esc>gv')
noremap('v', '<S-Tab>', '<<<Esc>gv')

-------------- TERM MODE --------------------
-- window switching --
noremap('t', '<C-left>',  '<C-w>h')
noremap('t', '<C-right>', '<C-w>l')
noremap('t', '<C-down>',  '<C-w>j')
noremap('t', '<C-up>',    '<C-w>k')
