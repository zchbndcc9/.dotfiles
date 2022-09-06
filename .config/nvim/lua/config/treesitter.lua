local at_internal = require 'nvim-ts-autotag.internal'
local unpack = table.unpack or unpack

require 'nvim-treesitter.configs'.setup {
	ensure_installed = { 'norg', 'tsx', 'javascript', 'lua', 'json' },
	autotag = {
		enable = true,
		filetypes = { 'heex', unpack(at_internal.tbl_filetypes) },
	},
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
			},
		},
		lsp_interop = {
			enable = true,
			border = 'none',
			peek_definition_code = {
				['<leader>df'] = '@function.outer',
				['<leader>dF'] = '@class.outer',
			},
		},
	},
	endwise = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	}
}
