function setup()
	local vim = vim

	local has_words_before = function()
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	require("cmp-plugins").setup({})

	local cmp = require("cmp")
	local lspkind = require("lspkind")

	-- Optional: nicer popup borders + highlight linking
	vim.api.nvim_set_hl(0, "CmpBorder", { link = "FloatBorder" })
	vim.api.nvim_set_hl(0, "CmpDocBorder", { link = "FloatBorder" })

	local menu_labels = {
		nvim_lsp = "LSP",
		buffer = "BUF",
		path = "PATH",
		luasnip = "SNIP",
		nvim_lua = "LUA",
		treesitter = "TS",
		git = "GIT",
		emoji = "EMOJI",
	}

	local function format_menu(entry, vim_item)
		-- Kind: icon + text (lspkind) -> "  Snippet", etc.
		vim_item.kind = lspkind.symbolic(vim_item.kind, { with_text = true })

		-- Right column “menu” tag per source
		vim_item.menu = menu_labels[entry.source.name] or entry.source.name

		-- Truncate long labels for a tighter menu
		local max = 40
		if #vim_item.abbr > max then
			vim_item.abbr = vim_item.abbr:sub(1, max - 1) .. "…"
		end

		return vim_item
	end

	cmp.setup({
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = format_menu,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
		}, {
			name = "buffer",
		}),
		window = {
			completion = cmp.config.window.bordered({
				border = "rounded",
				winhighlight = "Normal:NormalFloat,FloatBorder:CmpBorder,CursorLine:PmenuSel,Search:None",
				scrollbar = true,
			}),
			documentation = cmp.config.window.bordered({
				border = "rounded",
				winhighlight = "Normal:NormalFloat,FloatBorder:CmpDocBorder",
				scrollbar = true,
			}),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-K>"] = cmp.mapping.select_next_item(),
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
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
		window = {
			completion = cmp.config.window.bordered({ border = "rounded" }),
		},
	})

	cmp.setup.filetype("lua", {
		sources = cmp.config.sources({
			{ name = "nvim_lua" },
			{ name = "plugins" },
		}, {
			name = "buffer",
		}),
	})

	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "cmp_git" },
		}, {
			name = "buffer",
		}),
	})

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

return {
	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"tamago324/cmp-zsh",
			"L3MON4D3/LuaSnip",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"dcampos/nvim-snippy",
			"dcampos/cmp-snippy",
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lua",
			"KadoBOT/cmp-plugins",
			"windwp/nvim-autopairs",
		},
		config = setup
	},
}
