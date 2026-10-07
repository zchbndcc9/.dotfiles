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

			treesitter.install({ "typescript", "tsx", "javascript", "lua", "json", "html", "markdown" })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "typescript", "javascript", "lua", "typescriptreact", "html", "json", "markdown" },
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
			move = {
				set_jumps = true,
			},
			select = {
				lookahead = true,
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
				},
			},
		},
		config = function(_plugin, opts)
			local select = require("nvim-treesitter-textobjects.select").select_textobject
			local move = require("nvim-treesitter-textobjects.move")

			require("nvim-treesitter-textobjects").setup(opts)

			vim.keymap.set({ "x", "o" }, "aF", function()
				select("@function.outer", "textobjects")
			end, { desc = "FUNCTION" })

			vim.keymap.set({ "x", "o" }, "af", function()
				select("@function.inner", "textobjects")
			end, { desc = "function" })

			vim.keymap.set({ "n", "x", "o" }, "]m", function()
				move.goto_next_start("@function.outer", "textobjects")
			end, { desc = "next function" })

			vim.keymap.set({ "n", "x", "o" }, "]M", function()
				move.goto_next_end("@function.outer", "textobjects")
			end, { desc = "next function end" })

			vim.keymap.set({ "n", "x", "o" }, "[m", function()
				move.goto_previous_start("@function.outer", "textobjects")
			end, { desc = "previous function" })

			vim.keymap.set({ "n", "x", "o" }, "[M", function()
				move.goto_previous_end("@function.outer", "textobjects")
			end, { desc = "previous function end" })
		end,
	},
}
