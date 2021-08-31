call plug#begin('~/.local/share/nvim/plugged')
  
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  
  " HTML
  Plug 'alvan/vim-closetag'
  
  Plug 'famiu/bufdelete.nvim'

  " Typescript
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
  
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
  
  " Completion
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

  Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

  " Autocomplete
  Plug 'ncm2/ncm2'
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-gtags'
  Plug 'ncm2/ncm2-syntax'
  Plug 'Shougo/neco-syntax'
  Plug 'ncm2/ncm2-cssomni'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'ncm2/ncm2-tern', {'do': 'npm install'}
  
  Plug 'folke/tokyonight.nvim'
  
  " Ruby
  Plug 'vim-ruby/vim-ruby'
  
  Plug 'norcalli/nvim-colorizer.lua'
  
  " Utils
  Plug 'sheerun/vim-polyglot'
  
  Plug 'kana/vim-textobj-function'
  Plug 'haya14busa/vim-textobj-function-syntax'
  
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
  Plug 'dense-analysis/ale'
  Plug 'kana/vim-textobj-user'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-unimpaired' 
  Plug 'qpkorr/vim-bufkill'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  " TODO May want to remove nerdcommenter
  Plug 'preservim/nerdcommenter'

  Plug 'sunjon/shade.nvim'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive' 

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
  Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
  Plug 'akinsho/bufferline.nvim'
  
  
  call plug#end()
