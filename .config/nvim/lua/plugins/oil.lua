return {
	--- File Explorer
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			win_options = {
				signcolumn = "yes:2",
			},
		},
		dependencies = {
			{ "nvim-mini/mini.icons", opts = {} },
		},
		keys = {
			{ "<leader>o", ":Oil<CR>", desc = "Open parent directory" },
		},
		lazy = false,
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = {
			"stevearc/oil.nvim",
		},
		config = true,
	},
}
