-- luacheck: globals vim
local function noremap(mode, bind, command)
	vim.api.nvim_set_keymap(mode, bind, command, {noremap = true, silent = true,})
end
local function map(mode, bind, command)
	vim.api.nvim_set_keymap(mode, bind, command, {noremap = false, silent = true,})
end
local function norecallback(mode, key, lua_function)
	vim.api.nvim_set_keymap(mode, key, '', {noremap = true, callback = lua_function, silent = true,})
end

local isHydraLoaded, Hydra = pcall(require, 'hydra')

-------------- NORMAL MODE ------------------
--- prep leader keys ---
noremap('n', 'f', '')  -- unbind
noremap('n', 'F', '')  -- unbind

--- telescope ---
local isTelescopeLoaded, telescope = pcall(require, 'telescope')
if isTelescopeLoaded then
	norecallback('n', 'ftd', function()
		telescope.builtin.lsp_document_symbols({
			symbols = 'function',
		})
	end)
end

--- half insert mode ---
noremap('n', ' ', 'i <Esc>l')
noremap('n', '<Return>', 'o<Esc>')
noremap('n', '<BackSpace>', 'hx')

--- delete to line begin ---
noremap('n', 'd^', 'v^x')

--- copy mode ---
noremap('n', '<F3>', ':set nornu nonu list!<CR>')

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

--- open files ---
norecallback('n', 'ftf', function() require('telescope.builtin').find_files() end) -- file-opener
norecallback('n', 'ftg', function() require('telescope.builtin').live_grep()  end) -- grep.

--- buffer management ---
norecallback('n', 'fb', function() require('telescope.builtin').buffers() end) -- buffer-switcher
-- move between buffers
noremap('n', '<C-left>',  '<C-w>h')
noremap('n', '<C-right>', '<C-w>l')
noremap('n', '<C-down>',  '<C-w>j')
noremap('n', '<C-up>',    '<C-w>k')

--- tab indent ---
map('n', '>>', '')
map('n', '<<', '')
noremap('n', '<Tab>', '>>')
noremap('n', '<S-Tab>', '<<')

--- LSP ---
norecallback('n', 'gd', vim.lsp.buf.definition)
norecallback('n', 'gD', vim.lsp.buf.declaration)
norecallback('n', 'gr', vim.lsp.buf.references)
norecallback('n', 'gi', vim.lsp.buf.implementation)
norecallback('n', 'fh', vim.lsp.buf.hover)  -- TODO: noice or lspsaga
norecallback('n', 'fN', vim.diagnostic.goto_prev)
norecallback('n', 'fn', vim.diagnostic.goto_next)
norecallback('n', 'fl', vim.diagnostic.setloclist)

------- HYDRAS -------
if isHydraLoaded then
	--- drawing ---
	Hydra({
		name = 'Draw Diagram',
		hint = [[
Arrow^^^^^^   Select region with <C-v>
^ ^ _w_ ^ ^   _f_: surround it with box
_a_ ^ ^ _s_
^ ^ _r_ ^ ^                      _<Esc>_]],
		config = {
			color = 'pink',
			invoke_on_body = true,
			hint = {border = 'rounded'},
			on_enter = function()
				vim.o.virtualedit = 'all'
			end,
		},
		mode = 'n',
		body = 'faa',
		heads = {
			--{ 'H', '<C-v>h:VBox<CR>' },
			{ 'a', '<C-v>h:VBox<CR>' },
			--{ 'J', '<C-v>j:VBox<CR>' },
			{ 'r', '<C-v>j:VBox<CR>' },
			--{ 'K', '<C-v>k:VBox<CR>' },
			{ 'w', '<C-v>k:VBox<CR>' },
			--{ 'L', '<C-v>l:VBox<CR>' },
			{ 's', '<C-v>l:VBox<CR>' },
			{ 'f', ':VBox<CR>', { mode = 'v' }},
			{ '<Esc>', nil, { exit = true } },
		}
	})

	--- DAP ---
	Hydra({
		name = 'DAP',
		hint = [[
╺┳┓┏━┓┏━┓ _ _: continue    _t_: terminate     _<Esc>_
 ┃┃┣━┫┣━┛ _i_: step into   _r_: toggle repl
╺┻┛╹ ╹╹   _o_: step over   _b_: toggle breakp]],
		config = {
			color = 'pink',
			invoke_on_body = true,
			hint = {border = 'rounded'},
		},
		mode = 'n',
		body = 'fD',
		heads = {
			{' ', ':DapContinue<CR>'},
			{'i', ':DapStepInto<CR>'},
			{'o', ':DapStepOver<CR>'},
			{'t', ':DapTerminate<CR>', {exit = true}},
			{'r', ':DapToggleRepl<CR>'},
			{'b', ':DapToggleBreakpoint<CR>'},
			{'<Esc>', nil, {exit = true}},
		},
	})
end

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
