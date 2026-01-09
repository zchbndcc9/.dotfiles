return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-live-grep-args.nvim",
		},
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope: Find files",
			},
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files({ hidden = true })
				end,
				desc = "Telescope: Find files (incl. hidden)",
			},
			{
				"<leader>rg",
				function()
					require("telescope").extensions.live_grep_args.live_grep_args()
				end,
				desc = "Telescope: Live grep",
			},
			{
				"<leader>wg",
				function()
					require("telescope-live-grep-args.shortcuts").grep_word_under_cursor()
				end,
				desc = "Telescope: Live grep word",
			},
			{
				"<leader>rg",
				function()
					require("telescope-live-grep-args.shortcuts").grep_visual_selection()
				end,
				mode = "v",
				desc = "Telescope: Live grep selection"
			},
			{
				"<leader>fb",
				function()
					require("telescope.builtin").git_branches()
				end,
				desc = "Telescope: Find git branches",
			},
			{
				"<leader>fc",
				function()
					require("telescope.builtin").colorscheme()
				end,
				desc = "Change color scheme",
			},
			{
				"<leader>fr",
				function()
					require('telescope.builtin').lsp_references()
				end,
				desc = "View references"
			}
		},
		config = function()
			local telescope = require("telescope")
			local telescope_actions = require("telescope.actions")
			local lga_actions = require("telescope-live-grep-args.actions")

			telescope.setup({
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
				},
				extensions = {
					live_grep_args = {
						mappings = {
							i = {
								["<C-Space>"] = lga_actions.to_fuzzy_refine,
							}
						}
					}
				},
				defaults = {
					maps = {
						i = {
							["<C-J>"] = telescope_actions.move_selection_next,
							["<C-K>"] = telescope_actions.move_selection_previous,
							["<C-A>"] = false,
						},
					},
				},
			})
			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args")
		end,
	},
}
