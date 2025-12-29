return {
	"nathom/filetype.nvim",
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
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config,
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
			ensure_installed = { "lua_ls" },
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
	{ "windwp/nvim-ts-autotag", config = true },
	"famiu/bufdelete.nvim",
	{ "norcalli/nvim-colorizer.lua", config = true },
	"rhysd/conflict-marker.vim",
	{ "tpope/vim-fugitive", keys = { "<C-G><C-G>", ":Git<CR>", desc = "Open Git menu" } },
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

	"neovim/nvim-lspconfig",
	-- Completion
	{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },

	-- Diagnostic explorer
	{
		"folke/trouble.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		config = true,
	},

	-- Peek line with comand :{number}
	{ "nacro90/numb.nvim", config = true },
	{ "kylechui/nvim-surround", config = true },
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
