return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		dependencies = {
			"RRethy/nvim-treesitter-endwise",
			"nvim-treesitter/nvim-treesitter-context",
		},
		opts = {},
		config = function(_plugin, opts)
			local treesitter = require("nvim-treesitter")

			treesitter.setup(opts)

			treesitter.install({ "typescript", "tsx", "javascript", "lua", "json", "html" })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "typescript", "javascript", "lua", "typescriptreact", "html", "json" },
				callback = function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true
		end,
		opts = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
			-- 			-- 	move = {
			-- 			-- 		enable = true,
			-- 			-- 		set_jumps = true, -- whether to set jumps in the jumplist
			-- 			-- 		goto_next_start = {
			-- 			-- 			["]m"] = "@function.outer",
			-- 			-- 			["]]"] = "@class.outer",
			-- 			-- 		},
			-- 			-- 		goto_next_end = {
			-- 			-- 			["]M"] = "@function.outer",
			-- 			-- 			["]["] = "@class.outer",
			-- 			-- 		},
			-- 			-- 		goto_previous_start = {
			-- 			-- 			["[m"] = "@function.outer",
			-- 			-- 			["[["] = "@class.outer",
			-- 			-- 		},
			-- 			-- 		goto_previous_end = {
			-- 			-- 			["[M"] = "@function.outer",
			-- 			-- 			["[]"] = "@class.outer",
			-- 			-- 		},
			-- 			-- 	},
			-- 			-- 	lsp_interop = {
			-- 			-- 		enable = true,
			-- 			-- 		border = "none",
			-- 			-- 		peek_definition_code = {
			-- 			-- 			["<leader>df"] = "@function.outer",
			-- 			-- 			["<leader>dF"] = "@class.outer",
			-- 			-- 		},
			-- 			-- 	},
		},
	},
}
