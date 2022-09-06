require 'cmp-plugins'.setup {}

local cmp = require 'cmp'

cmp.setup {
	formatting = {
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			local kind = require 'lspkind'.cmp_format({
				mode = 'symbol_text',
				maxwidth = 50
			})(entry, vim_item)

			kind.kind = "[" .. kind.kind .. "]"

			return kind
		end,

	},
	sources = cmp.config.sources ({
		{ name = 'nvim_lsp' },
		{ name = 'snippy' },
		{ name = 'nvim_lua' },
		{ name = 'plugins' },
	}, {
			name = 'buffer',
	}),
	snippet = {
		expand = function(args)
			require 'snippy'.expand_snippet(args.body)
		end
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
}

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources ({
		{ name = 'cmp_git' }
	}, {
		name = 'buffer',
	})
})

local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
