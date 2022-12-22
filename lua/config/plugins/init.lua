-- luacheck: globals vim

-- configure plugin list
return {
	{'tpope/vim-sleuth', lazy=false}, -- aut tab/space
	'anuvyklack/hydra.nvim', -- better keybinds
	{'Raimondi/delimitMate', lazy=false},  -- auto close delimiters
	{'tpope/vim-commentary', keys={'gc', 'gcc', 'gbc'}, lazy = false},  -- fast comment
	{'metakirby5/codi.vim', cmd = {'Codi'}},
	{'Shougo/junkfile.vim', cmd = {'JunkfileOpen'}},
	{'jbyuki/venn.nvim', cmd = {'VBox'}},

	--- syntax ---
	{'aklt/plantuml-syntax', ft = 'plantuml'},
	{'mracos/mermaid.vim', ft = 'mermaid'},
	-- {'python-rope/ropevim', ft = {'python'}},  -- https://github.com/python-rope/ropevim/issues/97
	{'mboughaba/i3config.vim', ft = 'i3config'},
	{'wgwoods/vim-systemd-syntax', ft = 'systemd'},
	{'mechatroner/rainbow_csv',
		ft = {'csv','csv_semicolon','csv_whitespace','csv_pipe','tsv','rfc_csv','rfc_semicolon',},
	},
	{'habamax/vim-asciidoctor', ft = 'asciidoc'},
	{'ron-rs/ron.vim', ft = 'ron'},
	--{'https://gitlab.com/inko-lang/inko.vim.git', ft = 'inko'},

	--- bookmarks ---
}
