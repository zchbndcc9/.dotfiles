return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{
				"ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope: Find files",
			},
			{
				"<leader>rg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Telescope: Live grep",
			},
			{
				"fb",
				function()
					require("telescope.builtin").git_branches()
				end,
				desc = "Telescope: Find git branches",
			},
			{
				"fc",
				function()
					require("telescope.builtin").colorscheme()
				end,
				desc = "Change color scheme",
			},
		},
		config = function()
			local telescope = require("telescope")
			local telescope_actions = require("telescope.actions")

			telescope.setup({
				pickers = {
					colorscheme = {
						enable_preview = true,
					},
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
		end,
	},
}
