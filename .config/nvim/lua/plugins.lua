local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require 'lazy'.setup({
	'lewis6991/impatient.nvim',
	'nathom/filetype.nvim',
	{ 'max397574/better-escape.nvim', config = true },
	{ 'chentoast/marks.nvim',         config = true },
	{ 'folke/which-key.nvim',         config = true },
	{
		'zbirenbaum/copilot.lua',
		config = true,
		event = "InsertEnter",
		opts = {
			suggestion = {
				enabled = true,
				auto_trigger = true,
			}
		}
	},

	{ 'williamboman/mason.nvim', config = true },
	{
		'pwntester/octo.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'kyazdani42/nvim-web-devicons',
		},
		opts = {
			default_remote = { 'github', 'origin' }
		},
		config = true,
	},

	{
		'lukas-reineke/indent-blankline.nvim',
		init = function()
			vim.opt.termguicolors = true
			vim.opt.list = true
		end,
		opts = {
			show_current_context = true,
			show_current_context_start = true,
		},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		dependencies = {
			'p00f/nvim-ts-rainbow',
			'windwp/nvim-ts-autotag',
			'RRethy/nvim-treesitter-endwise',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/nvim-treesitter-context',
		},
		config = function() require 'plugins.treesitter' end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		dependencies = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig',
		},
		config = function()
			require 'mason-lspconfig'.setup {}


			require 'mason-lspconfig'.setup_handlers {
				function(server_name)
					require 'lspconfig'[server_name].setup {}
				end
			}
		end,
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	{
		'feline-nvim/feline.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
			'lewis6991/gitsigns.nvim',
			'folke/tokyonight.nvim',
		},
		config = function() require 'plugins.feline' end,
	},
	{
		'akinsho/bufferline.nvim',
		init = function()
			vim.opt.termguicolors = true
		end,
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = true,
	},
	{
		'kyazdani42/nvim-web-devicons',
		opts = {
			default = true,
		},
		config = true,
	},
	{
		'nvim-neo-tree/neo-tree.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
		},
		lazy = true,
		keys = {
			{ 'C-t',    ":Neotree toggle<CR>" },
			{ '<C-t>f', ":Neotree focus<CR>" },
		},
		config = true,
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		},
		keys = {
			{ 'ff',         ':Telescope find_files<CR>' },
			{ '<leader>ag', ':Telescope live_grep<CR>' },
			{ 'fb',         ':Telescope git_branches<CR>' },
			{ 'fc',         ':Telescope colorschemes<CR>' },
		},
		config = true,
	},
	{ 'windwp/nvim-ts-autotag',  config = true },
	'famiu/bufdelete.nvim',
	{ 'norcalli/nvim-colorizer.lua', config = true },
	{
		'lewis6991/gitsigns.nvim',
		config = function() require 'plugins.gitsigns' end,
	},
	'rhysd/conflict-marker.vim',
	{ 'tpope/vim-fugitive',          keys = { '<C-G><C-G>', ":Git<CR>" } },
	{
		'ray-x/lsp_signature.nvim',
		config = true,
		event = 'InsertEnter'
	},
	{
		'windwp/nvim-autopairs',
		opts = {
			check_ts = true,
			ts_config = {
				javascript = { 'template_string' },
			}
		},
	},

	-- Command menu
	{
		'gelguy/wilder.nvim',
		config = function() require 'plugins.wilder' end,
	},

	'neovim/nvim-lspconfig',
	-- Completion
	{ 'L3MON4D3/LuaSnip',       build = 'make install_jsregexp' },
	{
		'hrsh7th/nvim-cmp',
		event = "InsertEnter",
		dependencies = {
			'tamago324/cmp-zsh',
			'L3MON4D3/LuaSnip',
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'dcampos/nvim-snippy',
			'dcampos/cmp-snippy',
			'onsails/lspkind.nvim',
			'hrsh7th/cmp-nvim-lua',
			'KadoBOT/cmp-plugins',
			'windwp/nvim-autopairs',
		},
		config = function() require 'plugins.cmp' end,
	},

	-- Diagnostic explorer
	{
		'folke/trouble.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' },
		config = true,
	},

	-- Peek line with comand :{number}
	{ 'nacro90/numb.nvim',      config = true },
	{ 'kylechui/nvim-surround', config = true },
	'tpope/vim-repeat',
	{ 'numToStr/Comment.nvim', config = true },
	-- YAML
	{
		'stephpy/vim-yaml',
		ft = { 'yaml ' }
	},

	-- Colorschemes
	-- Main colorschemes should not be lazily loaded
	{ 'folke/tokyonight.nvim' },
	{
		'shaunsingh/moonlight.nvim',
		init = function()
			vim.g.moonlight_italic_comments = true
			vim.g.moonlight_italic_keywords = true
			vim.g.moonlight_contrast = true
		end,
		lazy = true,
	},
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		lazy = true,
	},
	{
		'pantharshit00/vim-prisma',
		ft = { 'prisma' },
	},
	{
		'fladson/vim-kitty',
		ft = { 'kitty' },
	},
	{
		'brendalf/mix.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		ft = { 'elixir', 'heex' }
	},
	{
		'axelvc/template-string.nvim',
		ft = {
			'javascript',
			'javascriptreact',
			'typescript',
			'typescriptreact',
		}
	},
})
