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
		"nvim-tree/nvim-web-devicons",
		opts = {},
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
			extensions = { "oil", "fugitive", "lazy", "mason", "quickfix" },
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
	{ "akinsho/git-conflict.nvim", opts = {} },
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
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			},
		},
		keys = {
			{
				"<leader>fi",
				function()
					require("conform").format()
				end,
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
	{
		"hrsh7th/nvim-pasta",
		keys = {
			{
				"p",
				function()
					require("pasta.mapping").p()
				end,
				{ "n", "x" },
				desc = "Paste",
			},
			{
				"P",
				function()
					require("pasta.mapping").P()
				end,
				{ "n", "x" },
				desc = "Paste before",
			},
		},
	},
	{
		"romus204/referencer.nvim",
		opts = {
			enable = true,
		},
		keys = {
			{ "<leader>vr", "<CMD>ReferencerToggle<CR>", desc = "View number references" },
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = "cd app & yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		keys = {
			{
				"[t",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Previous todo comment",
			},
			{
				"]t",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
		},
	},
}
