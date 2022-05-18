return require'packer'.startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'weilbith/nvim-code-action-menu'

  -- LSP
  use 'williamboman/nvim-lsp-installer'
  use 'neovim/nvim-lspconfig'
  use 'prabirshrestha/vim-lsp'
  use 'hoob3rt/lualine.nvim'
  use 'akinsho/bufferline.nvim'

  -- Icons
  use 'ryanoasis/vim-devicons'
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {
        'nvim-telescope/telescope-frecency.nvim',
        config = function()
          require'telescope'.load_extension('frecency')
        end,
        requires = {'tami5/sqlite.lua'}
      }
    }
  }

  use 'alvan/vim-closetag'
  use 'famiu/bufdelete.nvim'
  use 'sheerun/vim-polyglot'
  use 'kana/vim-textobj-function'
  use 'haya14busa/vim-textobj-function-syntax'
  use 'kana/vim-textobj-user'
  use 'qpkorr/vim-bufkill'
  use 'norcalli/nvim-colorizer.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'github/copilot.vim'
  use 'lewis6991/spellsitter.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'windwp/nvim-autopairs'
  use 'prettier/vim-prettier'

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
    }
  }

  use 'folke/trouble.nvim'
  use 'folke/lsp-colors.nvim'

  use 'ludovicchabant/vim-gutentags'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
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
    'shaunsingh/moonlight.nvim' ,
    { 'catppuccin/nvim', as = 'catppuccin' },
  }

  use 'pantharshit00/vim-prisma'
  use 'fladson/vim-kitty'
end)

