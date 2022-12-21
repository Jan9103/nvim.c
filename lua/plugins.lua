-- luacheck: globals vim

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- configure plugin list
return require('lazy').setup({
	--- common dependencies
	'nvim-lua/plenary.nvim',

	{'williamboman/mason.nvim',
		enabled = false,
		config = function() require('config.mason') end,
	},

	{'mfussenegger/nvim-dap',
		-- after = 'williamboman/mason.nvim',
		config = function() require('config.dap') end,
	},
	{'rcarriga/cmp-dap',
		dependencies = {'mfussenegger/nvim-dap', 'hrsh7th/nvim-cmp'},
	},

	{'jayp0521/mason-nvim-dap.nvim',
		enabled = false,
		dependencies = {'mfussenegger/nvim-dap', 'williamboman/mason.nvim'},
		config = function() require("mason-nvim-dap").setup() end,
	},

	{'williamboman/mason-lspconfig.nvim',
		enabled = false,
		config = function() require("config.mason-lspconfig") end,
		dependencies = {'williamboman/mason.nvim'},
	},

	{'neovim/nvim-lspconfig',
		--after = 'mason-lspconfig.nvim',
	},

	{'tamago324/nlsp-settings.nvim',
		config = function() require('lsp_setup') end,
		dependencies = {'neovim/nvim-lspconfig'},
	},

	{'jose-elias-alvarez/null-ls.nvim',
		--enabled = false,
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function() require('config.null_ls') end,
	},

	{'jayp0521/mason-null-ls.nvim',
		enabled = false,
		dependencies = {'williamboman/mason.nvim', 'jose-elias-alvarez/null-ls.nvim'},
		config = function() require("mason-null-ls").setup() end,
	},

	{'mfussenegger/nvim-lint',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function() require('config.nvim_lint') end,
	},

	--- sleuth (auto tab/ space) ---
	'tpope/vim-sleuth',

	--- telescope ---
	{'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'BurntSushi/ripgrep',
			{'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},  -- speed improvement
			'rcarriga/nvim-notify',
		},
		--config = function() require('config.telescope') end,
	},

	--- HYDRA ---
	'anuvyklack/hydra.nvim',

	--- TreeSitter ---
	{'nvim-treesitter/nvim-treesitter',
		commit = 'ea0e91b63abfb6e5db48aacf0bb257e053b0c805',  -- something later broke neorg, etc
		build = ':TSUpdate',
		config = function() require('config.treesitter') end,
	},
	{'nvim-treesitter/nvim-treesitter-context',
		dependencies = {'nvim-treesitter/nvim-treesitter'},
		config = function() require('config.TSContext') end,
	},
	-- readd todo highlight, which has been broken by TS
	{'folke/todo-comments.nvim',
		dependencies = {'nvim-lua/plenary.nvim'},
		config = function() require("todo-comments").setup{} end,
	},

	--- tabcomplete ----
	--'~/git/nu_snippets',
	{'L3MON4D3/LuaSnip',
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()  -- load friendly-snippets
		end,
		dependencies = {'rafamadriz/friendly-snippets'},
	},
	{'hrsh7th/nvim-cmp',
		dependencies = {
			'L3MON4D3/LuaSnip',
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			{'hrsh7th/cmp-nvim-lsp-signature-help', ft = 'python'},
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'onsails/lspkind.nvim',
			--{'octaltree/cmp-look', ft = {'markdown', 'asciidoc', 'rst', 'text'}},
			{'hrsh7th/cmp-calc', ft = {'markdown', 'asciidoc', 'rst', 'text'}},
			{'jan9103/cmp-mocword', ft = {'markdown', 'text'}}
		},
		config = function() require('config.nvim_cmp') end,
	},

	{'saadparwaiz1/cmp_luasnip',  -- luasnip, cmp connector
		dependencies = {'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip'},
	},

	-- {'filipgodlewski/luasnip-ts-snippets.nvim',
	-- 	ft = {'lua'},
	-- 	config = function()
	-- 		require("luasnip-ts-snippets").setup({})
	-- 	end,
	-- },

	--- statusline ---
	{'nvim-lualine/lualine.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons', -- nerdfont
			'arkav/lualine-lsp-progress', -- lsp boot progress bar
		},
		config = function() require('config.lualine') end,
	},

	'Raimondi/delimitMate',  -- auto close delimiters
	'tpope/vim-commentary',  -- fast comment
	'Mofiqul/dracula.nvim',  -- colorscheme

	{'rcarriga/nvim-notify',
		config = function() require('config.notify') end,
	},

	---------------- syntax specific --------------
	{'LhKipp/nvim-nu',
		dependencies = {'nvim-treesitter/nvim-treesitter',}, -- 'jose-elias-alvarez/null-ls.nvim'},
		build = ':TSInstall nu',
		config = function() require('config.nvim_nu') end,
		ft = 'nu',
	},
	{'aklt/plantuml-syntax', ft = 'plantuml'},
	{'weirongxu/plantuml-previewer.vim',
		ft = 'plantuml',
		dependencies = 'tyru/open-browser.vim',
	},
	{'mracos/mermaid.vim', ft = 'mermaid'},
	-- {'python-rope/ropevim', ft = {'python'}},  -- https://github.com/python-rope/ropevim/issues/97
	{'mboughaba/i3config.vim', ft = 'i3config'},
	{'wgwoods/vim-systemd-syntax', ft = 'systemd'},
	{
		'mechatroner/rainbow_csv',
		ft = {'csv','csv_semicolon','csv_whitespace','csv_pipe','tsv','rfc_csv','rfc_semicolon',},
	},
	{'habamax/vim-asciidoctor', ft = 'asciidoc'},
	{'ron-rs/ron.vim', ft = 'ron'},
	--{'https://gitlab.com/inko-lang/inko.vim.git', ft = 'inko'},
	{'makerj/vim-pdf'},

	{'metakirby5/codi.vim', cmd = {'Codi'}},

	{'Shougo/junkfile.vim', cmd = {'JunkfileOpen'}},

	{'jbyuki/venn.nvim', cmd = {'VBox'}},

	{'Pocco81/HighStr.nvim',
		cmd = {'HSHighlight', 'HSImport'},
		config = function() require('config.highstr') end,
	},

	--- orgmode ---
	{'nvim-neorg/neorg', tag = '0.0.15', --tag = '0.0.12', -- 0.0.13 is broken   tag = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'hrsh7th/nvim-cmp',
			'nvim-neorg/neorg-telescope',
			{'folke/zen-mode.nvim', config = function() require'config.zenmode' end, lazy = true},
		},
		cmd = {'Neorg', 'NeorgStart'}, ft = 'norg',
		config = function() require'config.neorg' end,
	},

	--- git ---
	'tpope/vim-fugitive',
	{'junegunn/gv.vim',
		cmd = 'GV',
		dependencies = {'tpope/vim-fugitive'},
	},
	{'lewis6991/gitsigns.nvim',
		cmd = 'Gitsigns',
		config = function() require('gitsigns').setup() end,
	},

	--- trouble (a list of issues) ---
	{'folke/trouble.nvim',
		dependencies = {'kyazdani42/nvim-web-devicons'},
		config = function() require("trouble").setup{} end,
	},

	--- bookmarks ---
	{'MattesGroeger/vim-bookmarks',
		config = function() vim.g.bookmark_highlight_lines = 1 end,
	},
	{'tom-anders/telescope-vim-bookmarks.nvim',
		dependencies = {'MattesGroeger/vim-bookmarks', 'nvim-telescope/telescope.nvim'},
		enabled = false,
	},
})
