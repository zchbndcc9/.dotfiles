return require 'packer'.startup(function(use)
	use 'wbthomason/packer.nvim'

	use 'nathom/filetype.nvim'
	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
			'p00f/nvim-ts-rainbow',
			'RRethy/nvim-treesitter-endwise',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/nvim-treesitter-context',
		}
	}
	use {
		'folke/which-key.nvim',
		config = function()
			require 'which-key'.setup {}
		end
	}
	use {
		'kevinhwang91/nvim-ufo',
		requires = 'kevinhwang91/promise-async',
		config = [[require'config.ufo']]
	}

	use 'github/copilot.vim'
	use 'williamboman/mason.nvim'
	use {
		'williamboman/mason-lspconfig.nvim',
		requires = {
			'williamboman/mason.nvim',
			'neovim/nvim-lspconfig'
		}
	}
	use {
		'glepnir/lspsaga.nvim',
		branch = 'main',
	}
	use 'ggandor/leap.nvim'

	-- Elixir
	use {
		'brendalf/mix.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}

	-- TS/JS
	use 'axelvc/template-string.nvim'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'prabirshrestha/vim-lsp'
	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}

	use {
		'nvim-neotest/neotest',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'antoinemadec/FixCursorHold.nvim',
			'haydenmeade/neotest-jest',
		},
		config = function()
			local nmap = require'utils'.nmap

			require 'neotest'.setup {
				adapters = {
					require 'neotest-jest' {
						jestCommand = 'npm test',
					}
				}
			}

			nmap('<leader>i', require'neotest'.run.run)
		end
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use {
		'akinsho/bufferline.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}

	-- Icons
	use 'ryanoasis/vim-devicons'

	-- Tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' },
		tag = 'nightly'
	}

	use {
		'stevearc/dressing.nvim',
		config = function()
			require 'dressing'.setup {}
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}

	use {
		'mrshmllow/document-color.nvim',
		config = function()
			require("document-color").setup {}
		end
	}
	use 'windwp/nvim-ts-autotag'
	use 'famiu/bufdelete.nvim'
	use 'norcalli/nvim-colorizer.lua'
	use 'lewis6991/gitsigns.nvim'
	use 'ray-x/lsp_signature.nvim'
	use 'windwp/nvim-autopairs'

	use 'gelguy/wilder.nvim'

	-- Completion
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'dcampos/nvim-snippy',
			'dcampos/cmp-snippy',
			'onsails/lspkind.nvim'
		}
	}

	use {
		'folke/trouble.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	use 'folke/lsp-colors.nvim'

	use {
		'kylechui/nvim-surround',
		config = function()
			require 'nvim-surround'.setup {}
		end
	}
	use 'tpope/vim-repeat'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'

	-- YAML
	use 'stephpy/vim-yaml'

	-- Colorschemes
	use {
		{ 'challenger-deep-theme/vim', as = 'challenger-deep' },
		'NLKNguyen/papercolor-theme',
		'mhartington/oceanic-next',
		{ 'kyoz/purify', rtp = 'vim' },
		'flrnprz/candid.vim',
		'ghifarit53/tokyonight-vim',
		'jdsimcoe/abstract.vim',
		'rakr/vim-colors-rakr',
		'folke/tokyonight.nvim',
		'ray-x/aurora',
		'rebelot/kanagawa.nvim',
		'yonlu/omni.vim',
		'shaunsingh/moonlight.nvim',
		{ 'catppuccin/nvim', as = 'catppuccin' },
		{
			'rockyzhang24/arctic.nvim',
			requires = {
				'rktjmp/lush.nvim'
			}
		},
		{
			'Everblush/everblush.nvim',
			as = 'everblush',
		},
	}

	use 'pantharshit00/vim-prisma'
	use 'fladson/vim-kitty'
end)
