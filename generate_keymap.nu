#!/usr/bin/env nu

def main [
	--backend: string = 'c'
] {
	if ($backend == 'c') {
		keybinds_as_so
	} else if ($backend == 'lua') {
		keybinds_as_lua
	}
}

def keybinds_as_lua [] {
	open keybinds.csv
	| each {|i|
		$"vim.api.nvim_set_keymap\('($i.mode)', '($i.key)', '($i.action)', {noremap=true, silent=true})"
	}
	| str join "\n"
	| save -r lua/config/keybinds.lua
}

def keybinds_as_so [] {
	mut out = (
		open ./keybinds.csv
		| each {|i|
			$"map\(\"($i.mode)\", \"($i.key)\", \"($i.action)\");"  # "
		}
	)

	$out = ($out | prepend "#include \"./nvim.h\"\nint luaopen_config_keybinds() {")  # "

	$out = ($out | append 'return 1;}')

	$out
	| str join "\n"
	| save -r src/keybinds.c

	^gcc -o lua/config/keybinds.so -std=gnu11 -O2 src/keybinds.c -shared -fPIC

	rm src/keybinds.c
}
