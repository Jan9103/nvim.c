-- luacheck: globals vim
local packer_bootstrap = false
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
	})
	vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({function(use)
	use 'wbthomason/packer.nvim'  -- the packagemanager itself



	--- common dependencies
	use 'nvim-lua/plenary.nvim'

	use {'williamboman/mason.nvim',
		disable = true,
		config = function() require('config.mason') end,
	}

	use {'mfussenegger/nvim-dap',
		requires = {
			{'rcarriga/cmp-dap', after = {'nvim-dap', 'nvim-cmp'}}, -- tab-complete
		},
		after = 'mason.nvim',
		config = function() require('config.dap') end,
	}

	use {'jayp0521/mason-nvim-dap.nvim',
		disable = true,
		requires = {'nvim-dap', 'mason.nvim'},
		after = {'nvim-dap', 'mason.nvim'},
		config = function() require("mason-nvim-dap").setup() end,
	}

	use {'williamboman/mason-lspconfig.nvim',
		disable = true,
		config = function() require("config.mason-lspconfig") end,
		after = 'mason.nvim',
	}

	use {'neovim/nvim-lspconfig',
		--after = 'mason-lspconfig.nvim',
	}

	use {'tamago324/nlsp-settings.nvim',
		config = function() require('lsp_setup') end,
		after = 'nvim-lspconfig',
	}

	use {'jose-elias-alvarez/null-ls.nvim',
		--disable = true,
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('config.null_ls') end,
	}

	use {'jayp0521/mason-null-ls.nvim',
		disable = true,
		requires = {'mason.nvim', 'null-ls.nvim'},
		after = {'mason.nvim', 'null-ls.nvim'},
		config = function() require("mason-null-ls").setup() end,
	}

	use {'mfussenegger/nvim-lint',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('config.nvim_lint') end,
	}

	--- sleuth (auto use tab/ space) ---
	use 'tpope/vim-sleuth'

	--- telescope ---
	use {'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'BurntSushi/ripgrep'},
			{'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},  -- speed improvement
		},
		after = {'nvim-notify',},
		--config = function() require('config.telescope') end,
	}

	--- HYDRA ---
	use 'anuvyklack/hydra.nvim'

	--- TreeSitter ---
	use {'nvim-treesitter/nvim-treesitter',
		commit = 'ea0e91b63abfb6e5db48aacf0bb257e053b0c805',  -- something later broke neorg, etc
		run = ':TSUpdate',
		config = function() require('config.treesitter') end,
	}
	use {'nvim-treesitter/nvim-treesitter-context',
		requires = 'nvim-treesitter',
		--cmd = {'TSContextEnable', 'TSContextToggle'},
		after = 'nvim-treesitter',
		config = function() require('config.TSContext') end,
	}
	-- readd todo highlight, which has been broken by TS
	use {'folke/todo-comments.nvim',
		requires = "nvim-lua/plenary.nvim",
		config = function() require("todo-comments").setup{} end,
	}

	--- tabcomplete ----
	use 'rafamadriz/friendly-snippets'
	use '~/git/nu_snippets'
	use {'L3MON4D3/LuaSnip',
		require = {
		},
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()  -- load friendly-snippets
		end,
		after = {'friendly-snippets'},
	}
	use {'hrsh7th/nvim-cmp',
		requires = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			{'hrsh7th/cmp-nvim-lsp-signature-help', ft = 'python'},
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'onsails/lspkind.nvim',
			{'octaltree/cmp-look', ft = {'markdown', 'asciidoc', 'rst', 'text'}},
			{'hrsh7th/cmp-calc', ft = {'markdown', 'asciidoc', 'rst', 'text'}},
		},
		config = function() require('config.nvim_cmp') end,
		after = {'LuaSnip'},
	}

	use {'saadparwaiz1/cmp_luasnip',  -- luasnip, cmp connector
		after ={'nvim-cmp', 'LuaSnip'},
	}

	use {'filipgodlewski/luasnip-ts-snippets.nvim',
		ft = {'lua'},
		config = function()
			require("luasnip-ts-snippets").setup({})
		end,
	}

	--- statusline ---
	use {'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', -- nerdfont
			'arkav/lualine-lsp-progress', -- lsp boot progress bar
		},
		after = 'lualine-lsp-progress',
		config = function() require('config.lualine') end,
	}

	use 'Raimondi/delimitMate'  -- auto close delimiters
	use 'tpope/vim-commentary'  -- fast comment
	use 'Mofiqul/dracula.nvim'  -- colorscheme

	use {'rcarriga/nvim-notify',
		config = function() require('config.notify') end,
	}

	---------------- syntax specific --------------
	use {'LhKipp/nvim-nu',
		requires = {'nvim-treesitter',}, -- 'null-ls.nvim'},
		run = ':TSInstall nu',
		config = function() require('config.nvim_nu') end,
		ft = 'nu',
	}
	use {'aklt/plantuml-syntax', ft = 'plantuml'}
	use {'weirongxu/plantuml-previewer.vim',
		ft = 'plantuml',
		requires = 'tyru/open-browser.vim',
	}
	use {'mracos/mermaid.vim', ft = 'mermaid'}
	-- use {'python-rope/ropevim', ft = {'python'}}  -- https://github.com/python-rope/ropevim/issues/97
	use {'mboughaba/i3config.vim', ft = 'i3config'}
	use {'wgwoods/vim-systemd-syntax', ft = 'systemd'}
	use {
		'mechatroner/rainbow_csv',
		ft = {'csv','csv_semicolon','csv_whitespace','csv_pipe','tsv','rfc_csv','rfc_semicolon',},
	}
	use {'habamax/vim-asciidoctor', ft = 'asciidoc'}
	use {'ron-rs/ron.vim', ft = 'ron'}
	--use {'~/git/vim_plugins/todo.txt'}
	use {'https://gitlab.com/inko-lang/inko.vim.git', ft = 'inko'}
	use {'makerj/vim-pdf'}

	use {'metakirby5/codi.vim', cmd = {'Codi'}}

	use {'Shougo/junkfile.vim', cmd = {'JunkfileOpen'}}

	use {'jbyuki/venn.nvim', cmd = {'VBox'}}

	use {'Pocco81/HighStr.nvim',
		cmd = {'HSHighlight', 'HSImport'},
		config = function() require('config.highstr') end,
	}

	--- orgmode ---
	use {'nvim-neorg/neorg', tag = '0.0.15', --tag = '0.0.12', -- 0.0.13 is broken   tag = '*',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-neorg/neorg-telescope',
			{'folke/zen-mode.nvim', config = function() require'config.zenmode' end, ft = 'norg'},
		},
		cmd = {'Neorg', 'NeorgStart'}, ft = 'norg',
		after = {'nvim-treesitter', 'telescope.nvim', 'nvim-cmp'},
		config = function() require'config.neorg' end,
	}

	--- git ---
	use 'tpope/vim-fugitive'
	use {'junegunn/gv.vim',
		cmd = 'GV',
		requires = 'vim-fugitive',
	}
	use {'lewis6991/gitsigns.nvim',
		cmd = 'Gitsigns',
		config = function() require('gitsigns').setup() end,
	}

	--- trouble (a list of issues) ---
	use {'folke/trouble.nvim',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function() require("trouble").setup{} end,
	}

	--- bookmarks ---
	use {'MattesGroeger/vim-bookmarks',
		config = function() vim.g.bookmark_highlight_lines = 1 end,
	}
	use {'tom-anders/telescope-vim-bookmarks.nvim',
		requires = {'vim-bookmarks', 'telescope.nvim'},
		disable = true,
	}



	if packer_bootstrap then
		require('packer').sync()
	end
end,
config = {
		display = {
			open_fn = function() return require('packer.util').float({border='single'}) end,
		},
		profile = {
			enable = true,
			threshold = 1,
		},
}})
