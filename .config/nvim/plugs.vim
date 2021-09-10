call plug#begin('~/.local/share/nvim/plugged')
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  
  " Utilities  
  Plug 'neovim/nvim-lspconfig'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'alvan/vim-closetag'
  Plug 'famiu/bufdelete.nvim'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'sheerun/vim-polyglot'
  Plug 'kana/vim-textobj-function'
  Plug 'haya14busa/vim-textobj-function-syntax'
  Plug 'dense-analysis/ale'
  Plug 'kana/vim-textobj-user'
  Plug 'jiangmiao/auto-pairs'
  Plug 'qpkorr/vim-bufkill'
  Plug 'norcalli/nvim-colorizer.lua'

  Plug 'ludovicchabant/vim-gutentags'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-unimpaired' 
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive' 

  Plug 'airblade/vim-gitgutter'

  " Javascript/React
  Plug 'othree/yajs.vim'
  Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

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
  
  call plug#end()
