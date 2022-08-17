require 'plugins'

local vim = vim
local opt = vim.opt
local nmap = require 'utils'.nmap
local vmap = require 'utils'.vmap
local imap = require 'utils'.imap

vim.g.mapleader = ';'

local unpack = table.unpack or unpack

opt.signcolumn = 'number'
opt.shiftwidth = 2
opt.tabstop = 2
opt.number = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.mouse = 'a'
opt.spelllang = 'en'
opt.termguicolors = true

opt.timeoutlen = 300

opt.completeopt = 'menuone,noinsert,noselect'

vim.keymap.set('', '<Space>', ':')
imap('jj', '<Esc>')

require('leap').set_default_keymaps()

nmap('<leader>q', [[:q<CR>]], { silent = true })
nmap('<leader>s', [[:w<CR>]], { silent = true })
nmap('<leader>w', [[:Bdelete<CR>]], { silent = true })

nmap('<C-n>', [[:bnext<CR>]])
nmap('<C-p>', [[:bprevious<CR>]])

nmap('<leader>le', [[:e $MYVIMRC<CR>]], { silent = true })
nmap('<leader>lr', [[:luafile $MYVIMRC<CR>]], { silent = true })

-- Pane switching
nmap('wj', '<C-w>j', { silent = true })
nmap('wh', '<C-w>h', { silent = true })
nmap('wk', '<C-w>k', { silent = true })
nmap('wl', '<C-w>l', { silent = true })
nmap('ss', '<C-w>s', { silent = true })
nmap('vv', '<C-w>v', { silent = true })

nmap('<C-G>', [[:Git<CR>]])

-- Tree
nmap('<C-t>', [[:NvimTreeToggle<CR>]])
nmap('<C-t>r', [[:NvimTreeRefresh<CR>]])
nmap('<C-t>f', [[:NvimTreeFindFile<CR>]])

-- Telescope
local telescope_builtin = require 'telescope.builtin'

nmap('ff', telescope_builtin.find_files)
nmap('<leader>ag', telescope_builtin.live_grep)
nmap('<leader>ob', telescope_builtin.buffers)
nmap('fb', telescope_builtin.git_branches)
nmap('fc', telescope_builtin.colorscheme)

local npairs = require 'nvim-autopairs'
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local actions = require 'telescope.actions'

local on_attach = function(client, bufnr)
	nmap('K', vim.lsp.buf.hover, { buffer = bufnr })
	nmap('gh', vim.lsp.buf.definition, { buffer = bufnr })
	nmap('gi', vim.lsp.buf.implementation, { buffer = bufnr })
	nmap('gL', vim.diagnostic.open_float, { buffer = bufnr })

	if client.server_capabilities.colorProvider then
		-- Attach document colour support
		require("document-color").buf_attach(bufnr, { mode = "background" })
	end
end


require 'mason'.setup {}
require 'mason-lspconfig'.setup {}

local servers = require 'mason-lspconfig'.get_installed_servers()
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- AAttach ufo config to lsp config
capabilities.textDocument.foldingRange = {
	dynamicRegistration = true,
	lineFoldingOnly = true,
}

-- Loop through servers and setup lspconfig
for _, server in ipairs(servers) do
	require 'lspconfig'[server].setup {
		server = server,
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
require 'ufo'.setup {
	fold_virt_text_handler = require 'config.ufo'
}

require 'lspsaga'.init_lsp_saga {
	border_style = 'rounded'
}

local action = require 'lspsaga.codeaction'

local wilder = require 'wilder'
wilder.setup {
	modes = { ':', '/', '?' },
}
local popupmenu_renderer = wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		border = 'rounded',
		highlighter = {
			wilder.pcre2_highlighter(),
			wilder.lua_fzy_highlighter(),
		},
		left = {
			' ',
			wilder.popupmenu_devicons(),
		},
	})
)
wilder.set_option('renderer', wilder.renderer_mux({
	[':'] = popupmenu_renderer,
	['/'] = popupmenu_renderer,
	['?'] = popupmenu_renderer,
}))

nmap('gd', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
nmap('<leader>rn', '<cmd>Lspsaga rename<CR>', { silent = true })
nmap("<leader>ca", action.code_action, { silent = true })
vmap("<leader>ca", function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	action.range_code_action()
end, { silent = true })

-- LSP
require 'null-ls'.setup {
	sources = {
		require 'null-ls'.builtins.code_actions.eslint,
		require 'null-ls'.builtins.code_actions.gitsigns,
		require 'null-ls'.builtins.code_actions.refactoring,

		require 'null-ls'.builtins.formatting.prettier,
		require 'null-ls'.builtins.formatting.rustywind,

		require 'null-ls'.builtins.diagnostics.eslint,
	},
}

nmap('<leader>fi', vim.lsp.buf.format)

local cmp = require 'cmp'

cmp.setup {
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
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources {
		{ name = 'nvim_lsp' },
		-- { name = 'cmp_tabnine' },
		{ name = 'snippy ' },
	},
}

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

npairs.setup {
	check_ts = true,
	ts_config = {
		javascript = { 'template_string' },
	}
}

vim.g.moonlight_italic_comments = true
vim.g.moonlight_italic_keywords = true
vim.g.moonlight_contrast = true

require 'nvim-tree'.setup {}

local at_internal = require 'nvim-ts-autotag.internal'
require 'nvim-treesitter.configs'.setup {
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
	},
	endwise = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	}
}

vim.cmd 'colorscheme kanagawa'

require 'lualine'.setup {
	options = {
		component_separators = '|',
		section_separators = { left = '', right = '' },
	},
}

require 'telescope'.setup {
	pickers = {
		colorscheme = {
			enable_preview = true
		}
	},
	defaults = {
		mappings = {
			i = {
				["<C-J>"] = actions.move_selection_next,
				["<C-K>"] = actions.move_selection_previous,
				["<C-A>"] = false,
			}
		}
	}
}

require 'bufferline'.setup()
require 'colorizer'.setup()
require 'gitsigns'.setup()
require 'trouble'.setup()
require 'lsp-colors'.setup()
require 'lsp_signature'.setup {
	floating_window_above_curr_line = true,
}
require 'template-string'.setup {}
