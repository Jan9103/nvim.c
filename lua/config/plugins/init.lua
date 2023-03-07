-- luacheck: globals vim

-- configure plugin list
return {
	-- live interpreter
	{'metakirby5/codi.vim', cmd = {'Codi'}},

	{ 'jan9103/download-lang-files.nvim',
		cmd = 'DownloadSpellLang',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function() require('download-lang-files').setup() end,
	},

	--- syntax ---
	{'aklt/plantuml-syntax', ft = 'plantuml'},
	{'mracos/mermaid.vim', ft = 'mermaid'},
	{'mechatroner/rainbow_csv',
		ft = {'csv','csv_semicolon','csv_whitespace','csv_pipe','tsv','rfc_csv','rfc_semicolon',},
	},
	{'habamax/vim-asciidoctor', ft = 'asciidoc'},
	{'ron-rs/ron.vim', ft = 'ron'},
}
