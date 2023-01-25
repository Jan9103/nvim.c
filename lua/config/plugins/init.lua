-- luacheck: globals vim

-- configure plugin list
return {
	-- better keybinds
	'anuvyklack/hydra.nvim',
	-- fast (un-) comment
	{'tpope/vim-commentary', keys={{'gc', mode='v'}, 'gcc'}},
	-- live interpreter
	{'metakirby5/codi.vim', cmd = {'Codi'}},
	-- temporary files
	{'Shougo/junkfile.vim', cmd = {'JunkfileOpen'}},

	{ 'jan9103/download-lang-files.nvim',
		cmd = 'DownloadSpellLang',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function() require('download-lang-files').setup() end,
	},

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
}
