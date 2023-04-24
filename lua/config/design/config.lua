local M = {}

M.c = {
	bg = '#282A36',
	fg = '#F8F8F2',
	selection = '#44475A',
	comment = '#6274A4',
	menu = '#21222c',
	visual = '#3e4452',
	gutter_fg = '#485263',
	nontext = '#3b4040',

	black = '#191a21',
	bright_blue = '#d6acff',
	bright_cyan = '#a4ffff',
	bright_green = '#69ff94',
	bright_magenta = '#ff92df',
	bright_red = '#ff6e6e',
	bright_white = '#ffffff',
	bright_yellow = '#ffffa5',
	cyan = '#88e9fd',
	gray = '#44475a',  -- TODO:
	green = '#50fa7b',
	orange = '#ffb86c',
	pink = '#ff79c6',
	purple = '#bd93f9',
	red = '#ff5555',
	white = '#abb2bf',
	yellow = '#f1fa8c',
}

M.lsp_symbols = {
	Error=" ",
	Info=" ",
	Warn=" ",
	Hint=" ",
}

M.file_icons = {
	bash=' ',
	c=' ',
	conf=' ',
	cpp=' ',
	css=' ',
	dockerfile=' ',
	dosini=' ',
	gitcommit=' ',
	go=' ',
	haskell=' ',
	html=' ',
	java=' ',
	javascript=' ',
	javascriptreact=' ',
	json=' ',
	lua=' ',
	markdown=' ',
	nu=' ',
	php=' ',
	python=' ',
	ruby=' ',
	rust=' ',
	scss=' ',
	sh=' ',
	text=' ',
	toml=' ',
	typescript=' ',
	vim=' ',
	zsh=' ',
}

return M
