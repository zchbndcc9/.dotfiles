require 'impatient'

return require 'packer'.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'lewis6991/impatient.nvim'
	use 'nathom/filetype.nvim'

	use {
		'jbyuki/instant.nvim',
		config = function()
			vim.g.instant_username = "zach.banducci"
		end
	}

	use {
		'max397574/better-escape.nvim',
		config = function()
			require 'better_escape'.setup {}
		end
	}

	use {
		'chentoast/marks.nvim',
		config = function()
			require 'marks'.setup {}
		end,
	}

	-- GH
	use {
		'pwntester/octo.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'kyazdani42/nvim-web-devicons',
		},
		config = function()
			require 'octo'.setup {
				default_remote = { 'github', 'origin' }
			}
		end
	}

	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			vim.opt.termguicolors = true
			vim.opt.list = true

			require 'indent_blankline'.setup {
				show_current_context = true,
				show_current_context_start = true,
			}
		end
	}

	-- treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
			'p00f/nvim-ts-rainbow',
			'RRethy/nvim-treesitter-endwise',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/nvim-treesitter-context',
		},
		config = [[require'config.treesitter']]
	}

	use {
		'folke/which-key.nvim',
		config = function()
			require 'which-key'.setup {}
		end
	}

	use 'github/copilot.vim'

	use 'ggandor/leap.nvim'

	-- Elixir
	use {
		'brendalf/mix.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		ft = { 'elixir', 'heex' }
	}

	-- TS/JS
	use {
		'axelvc/template-string.nvim',
		config = function()
			require 'template-string'.setup {}
		end,
		ft = {
			'javascript',
			'javascriptreact',
			'typescript',
			'typescriptreact',
		}
	}

	-- LSP
	use {
		'williamboman/mason-lspconfig.nvim',
		requires = 'williamboman/mason.nvim',
		config = function()
			require 'mason'.setup {}
			require 'mason-lspconfig'.setup {}
		end
	}
	use {
		'neovim/nvim-lspconfig',
		requires = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
			'nvim-telescope/telescope.nvim',
		},
		config = [[require'config.lsp']]
	}

	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = [[require'config.null-ls']]
	}

	use {
		'feline-nvim/feline.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'lewis6991/gitsigns.nvim',
		},
		config = [[require'config.feline']]
	}

	use {
		'akinsho/bufferline.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = require('bufferline').setup {}
	}

	use {
		'kyazdani42/nvim-web-devicons',
		config = function()
			require 'nvim-web-devicons'.setup {
				default = true,
			}
		end
	}

	-- Tree
	use {
		'nvim-neo-tree/neo-tree.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons',
			'nvim-lua/plenary.nvim',
			'MunifTanjim/nui.nvim',
		},
		config = function()
			local nmap = require 'utils'.nmap

			require('neo-tree').setup {}

			nmap('<C-t>', [[:Neotree toggle<CR>]], { silent = true })
			nmap('<C-t>f', [[:Neotree focus<CR>]], { silent = true })
		end
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-node-modules.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
		},
		config = [[require'config.telescope']]
	}

	use {
		'mrshmllow/document-color.nvim',
		config = function()
			require 'document-color'.setup {}
		end
	}
	use 'windwp/nvim-ts-autotag'
	use 'famiu/bufdelete.nvim'
	use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require 'colorizer'.setup {}
		end
	}

	-- Git
	use {
		'lewis6991/gitsigns.nvim',
		config = [[require'config.gitsigns']],
	}
	use 'rhysd/conflict-marker.vim'
	use 'tpope/vim-fugitive'

	use {
		'ray-x/lsp_signature.nvim',
		config = function()
			require 'lsp_signature'.setup {}
		end
	}

	use {
		'windwp/nvim-autopairs',
		config = function()
			require 'nvim-autopairs'.setup {
				check_ts = true,
				ts_config = {
					javascript = { 'template_string' },
				}
			}
		end
	}

	-- Command menu
	use {
		'gelguy/wilder.nvim',
		config = [[require'config.wilder']],
	}

	-- Completion
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'tamago324/cmp-zsh',
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
		},
		config = [[require'config.cmp']],
	}

	-- Diagnostic explorer
	use {
		'folke/trouble.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require 'trouble'.setup {}
		end
	}
	use {
		'folke/lsp-colors.nvim',
		config = function()
			require 'lsp-colors'.setup {}
		end
	}

	-- Peek line with comand :{number}
	use {
		'nacro90/numb.nvim',
		config = function()
			require 'numb'.setup {}
		end
	}

	use {
		'kylechui/nvim-surround',
		config = function()
			require 'nvim-surround'.setup {}
		end
	}
	use 'tpope/vim-repeat'

	use {
		'numToStr/Comment.nvim',
		config = function()
			require 'Comment'.setup {}
		end
	}

	-- YAML
	use {
		'stephpy/vim-yaml',
		ft = { 'yaml ' }
	}

	-- Colorschemes
	use {
		'folke/tokyonight.nvim',
		{
			'shaunsingh/moonlight.nvim',
			config = function()
				vim.g.moonlight_italic_comments = true
				vim.g.moonlight_italic_keywords = true
				vim.g.moonlight_contrast = true
			end
		},
		{
			'catppuccin/nvim',
			as = 'catppuccin',
			config = function()
				require 'catppuccin'.setup {}
			end
		},
	}

	use {
		'pantharshit00/vim-prisma',
		ft = { 'prisma' },
	}
	use {
		'fladson/vim-kitty',
		ft = { 'kitty' },
	}
end)
