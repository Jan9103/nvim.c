-- luacheck: globals vim
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")
local cmp = require'cmp'
local compare = require('cmp.config.compare')

cmp.setup({
	-- sorting = {
	-- 	comparators = {
	-- 		compare.score,
	-- 		compare.order,
	-- 	},
	-- },
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
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
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-BackSpace>"] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" })
	},

	-- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip', option = { use_show_condition = false }},
		{ name = 'buffer' },
		{ name = 'path' },
		--{ name = 'treesitter' },
	}),
})

cmp.setup.filetype('python', {
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip', option = { use_show_condition = false }},
		{ name = 'buffer' },
		{ name = 'nvim_lsp_signature_help' },
		--{ name = 'path' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		--{ name = 'git' },
		{ name = 'buffer' },
		--{ name = 'spell' },
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
		--{
		--	name = 'look',
		--	keyword_length = 2,
		--	option = {
		--		convert_case = true,
		--		loud = true
		--		--dict = '/usr/share/dict/words'
		--	},
		--},
	})
})

cmp.setup.filetype({'norg'}, {
	sources = cmp.config.sources({
		{ name = 'neorg' },
		{ name = 'buffer' },
		{ name = 'path' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		--{ name = 'nvim_lsp_document_symbol' },
		{ name = 'buffer' },
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
		{ name = 'cmdline' },
	})
})
