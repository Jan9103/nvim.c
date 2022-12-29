--'anuvyklack/hydra.nvim',
require('hydra')({
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
