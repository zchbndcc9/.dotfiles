local vim = vim

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require 'cmp-plugins'.setup {}

local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- Load snippets from friendly-snippets
require 'luasnip.loaders.from_vscode'.lazy_load()

cmp.setup {
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = require 'lspkind'.cmp_format({
			mode = 'symbol',
			maxwidth = 50,
			symbol_map = {
				Copilot = '',
			}
		})
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		name = 'buffer'
	}),
	snippet = {
		expand = function(args)
			require 'luasnip'.lsp_expand(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-K>'] = cmp.mapping.select_next_item(),
		["<Tab>"] = vim.schedule_wrap(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
}

cmp.setup.filetype('lua', {
	sources = cmp.config.sources({
		{ name = 'nvim_lua' },
		{ name = 'plugins' },
	}, {
		name = 'buffer',
	})
})

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }
	}, {
		name = 'buffer',
	})
})

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
