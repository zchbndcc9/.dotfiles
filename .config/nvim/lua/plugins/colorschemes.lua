local vim = vim

return {
	-- Main colorschemes should not be lazily loaded
	{ "folke/tokyonight.nvim" },
	{
		"shaunsingh/moonlight.nvim",
		init = function()
			vim.g.moonlight_italic_comments = true
			vim.g.moonlight_italic_keywords = true
			vim.g.moonlight_contrast = true
		end,
		lazy = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},
	{
		"sanshibu/nightfall.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
