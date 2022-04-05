call plug#begin('~/.local/share/nvim/plugged')
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'neovim/nvim-lspconfig'
  
  " Utilities  
  Plug 'prabirshrestha/vim-lsp'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'kyazdani42/nvim-tree.lua'
  
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'alvan/vim-closetag'
  Plug 'famiu/bufdelete.nvim'
  Plug 'sheerun/vim-polyglot'
  Plug 'kana/vim-textobj-function'
  Plug 'haya14busa/vim-textobj-function-syntax'
  Plug 'kana/vim-textobj-user'
  Plug 'jiangmiao/auto-pairs'
  Plug 'qpkorr/vim-bufkill'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'github/copilot.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  Plug 'folke/lsp-colors.nvim'

  Plug 'ludovicchabant/vim-gutentags'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-unimpaired' 
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive' 

  " Python
  Plug 'vim-scripts/indentpython.vim' 

  " Elixir / Phoenix
  Plug 'elixir-editors/vim-elixir'
  Plug 'andyl/vim-textobj-elixir'

  " YAML
  Plug 'stephpy/vim-yaml'
  
  " Ruby
  Plug 'vim-ruby/vim-ruby'
  
  " Colorschemes
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'mhartington/oceanic-next'
  Plug 'connorholyday/vim-snazzy'
  Plug 'kyoz/purify', { 'rtp': 'vim' }
  Plug 'flrnprz/candid.vim'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'jdsimcoe/abstract.vim'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  Plug 'chriskempson/base16-vim'
  Plug 'rakr/vim-colors-rakr'
  Plug 'folke/tokyonight.nvim'
  Plug 'ray-x/aurora'
  
  Plug 'pantharshit00/vim-prisma'
  
  call plug#end()
