-- load colorschemes a bit faster

-- A benchmark i did:
-- Filesize: 70-200lines (my average usecase)
-- Filetypes: nix, rs, py
-- with treesitter & my own lua colorscheme
--
-- without: 112-117ms for UIEnter
-- 1st time with: 127-134ms for UIEnter
-- 2nd/… time with: 140-160ms for UIEnter
return {
	enabled = false,
	'nullchilly/fastcolor.nvim',
	event = 'ColorSchemePre',
}
