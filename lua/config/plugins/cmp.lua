-- tab completion

-- luacheck: globals vim
local M = {
	'hrsh7th/nvim-cmp',
	lazy = false,
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-path',
		'jan9103/cmp-mocword',
		'neovim/nvim-lspconfig',
		'onsails/lspkind.nvim',
		--'PaterJason/cmp-conjure', -- {name = 'conjure'},
	},
}

function M.config()
	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local cmp = require'cmp'
	local compare = require('cmp.config.compare')

	cmp.setup({
		preselect = cmp.PreselectMode.None,
		window = {
			completion = {
				winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
				col_offset = -3,
				side_padding = 0,
			},
		-- 	completion = cmp.config.window.bordered(),
		-- 	documentation = cmp.config.window.bordered(),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				if strings[2] == nil then
					kind.kind = "   "
					kind.menu = "    (" .. (strings[1] or "") .. ")"
				else
					kind.kind = " " .. strings[1] .. " "
					kind.menu = "    (" .. strings[2] .. ")"
				end
				return kind
			end
		},
		mapping = {
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		},

		experimental = {
			ghost_text = true,
		},

		-- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua
		sorting = {
			comparators = {
				compare.exact,
				compare.score,
				compare.recently_used,
				compare.locality,
				compare.order,
			},
		},

		-- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'buffer' },
			{ name = 'path' },
		}),
	})

	cmp.setup.filetype('rust', {
		sources = cmp.config.sources({
			{ name = 'nvim_lsp', },
			--{ name = 'buffer' },
		})
	})

	cmp.setup.filetype('python', {
		sources = cmp.config.sources({
			{ name = 'nvim_lsp' },
			{ name = 'buffer' },
			{ name = 'nvim_lsp_signature_help' },
		})
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
			{ name = 'buffer' },
		})
	})

	cmp.setup.filetype({'markdown', 'asciidoc', 'text', 'rst'}, {
		sorting = {
			comparators = {
				compare.score,
				compare.order,
			},
		},
		sources = cmp.config.sources({
			{ name = 'calc' },
			{ name = 'buffer' },
			{ name = 'path' },
			{ name = 'mocword' },
		})
	})

	cmp.setup.filetype({'norg'}, {
		sources = cmp.config.sources({
			{ name = 'neorg' },
			{ name = 'buffer' },
			{ name = 'path' },
		})
	})

	cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			--{ name = 'nvim_lsp_document_symbol' },
			{ name = 'buffer' },
		}
	})

	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = 'path' },
			{ name = 'cmdline' },
		})
	})
end

return M
