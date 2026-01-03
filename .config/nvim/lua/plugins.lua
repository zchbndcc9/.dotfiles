return {
	{ "max397574/better-escape.nvim", config = true },
	{
		"chentoast/marks.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
	},
	{
		'nvim-tree/nvim-web-devicons',
		opts = {}
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config,
		--[[ 	 ]]
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		opts = {},
		lazy = false,
	},

	{ "mason-org/mason.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			automatic_enable = true,
			ensure_installed = { "lua_ls" },
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = { theme = "palenight" },
		},
	},
	{
		"akinsho/bufferline.nvim",
		init = function()
			vim.opt.termguicolors = true
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			default = true,
		},
		config = true,
	},
	{ "windwp/nvim-ts-autotag", config = true },
	{
		"famiu/bufdelete.nvim",
		keys = {
			{ "<leader>w", ":Bdelete<CR>", desc = "Delete buffer" },
			{ "<leader>W", ":Bdelete!<CR>", desc = "Delete buffer (force)" },
		},
	},
	{ "norcalli/nvim-colorizer.lua", opts = {} },
	"rhysd/conflict-marker.vim",
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<C-G><C-G>", ":Git<CR>", desc = "Open Git menu" },
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true,
			ts_config = {
				javascript = { "template_string" },
			},
		},
	},

	-- Diagnostic explorer
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = true,
	},

	{
		"kylechui/nvim-surround",
		version = "^3.0.0",
		event = "VeryLazy",
		opts = {},
	},

	"tpope/vim-repeat",
	{ "numToStr/Comment.nvim", config = true },
	-- YAML
	{
		"stephpy/vim-yaml",
		ft = { "yaml " },
	},

	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylelua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
	{
		"fladson/vim-kitty",
		ft = { "kitty" },
	},
	{
		"axelvc/template-string.nvim",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	},
	-- { diffview.nvim },
	-- { git-conflict.nvim }
	-- { nvim-lint }
	-- { todo-comments.nvim }
}
