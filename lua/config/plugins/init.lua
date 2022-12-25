-- luacheck: globals vim

-- configure plugin list
return {
	-- auto tab/space settings
	{'tpope/vim-sleuth', lazy=false},
	-- better keybinds
	'anuvyklack/hydra.nvim',
	-- auto close delimiters
	{'Raimondi/delimitMate', lazy=false},
	-- fast (un-) comment
	{'tpope/vim-commentary', keys={{'gc', mode='v'}, 'gcc'}},
	-- live interpreter
	{'metakirby5/codi.vim', cmd = {'Codi'}},
	-- temporary files
	{'Shougo/junkfile.vim', cmd = {'JunkfileOpen'}},
	-- draw boxes and arrows
	{'jbyuki/venn.nvim', cmd = {'VBox'}},
	-- remove trailing whitespaces
	-- waiting for <https://github.com/lewis6991/spaceless.nvim/pull/2>
	--{'lewis6991/spaceless.nvim', config = function() require'spaceless'.setup() end, lazy = false},

	-- {'python-rope/ropevim', ft = {'python'}},  -- https://github.com/python-rope/ropevim/issues/97

	--- syntax ---
	{'aklt/plantuml-syntax', ft = 'plantuml'},
	{'mracos/mermaid.vim', ft = 'mermaid'},
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
