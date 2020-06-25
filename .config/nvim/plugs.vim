call plug#begin('~/.local/share/nvim/plugged')
  " HTML
  Plug 'alvan/vim-closetag'
  
  " Javascript/React
  Plug 'othree/yajs.vim'

  " Python
  Plug 'vim-scripts/indentpython.vim' 

  " Elixir / Phoenix
  Plug 'elixir-editors/vim-elixir'
  Plug 'andyl/vim-textobj-elixir'

  " YAML
  Plug 'stephpy/vim-yaml'
  
  " Nerdtree
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  
  " Deoplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'wokalski/autocomplete-flow'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  
  " Utils
  Plug 'ap/vim-css-color' 
  Plug 'sheerun/vim-polyglot'
  
  Plug 'kana/vim-textobj-function'
  Plug 'haya14busa/vim-textobj-function-syntax'
  
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
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
  Plug 'ryanoasis/vim-devicons'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive' 

  " Colorschemes
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'connorholyday/vim-snazzy'
  Plug 'kyoz/purify', { 'rtp': 'vim' }
  Plug 'dracula/vim', {'as': 'dracula'}
  Plug 'flrnprz/candid.vim'
  Plug 'kjssad/quantum.vim'
  Plug 'ntk148v/vim-horizon'
  Plug 'rafalbromirski/vim-aurora'
  Plug 'DankNeon/vim'
  Plug 'cseelus/vim-colors-tone'
  Plug 'jdsimcoe/abstract.vim'
  Plug 'nightsense/nemo'
  Plug 'Zabanaa/neuromancer.vim'
  Plug 'nightsense/seabird'
  Plug 'nightsense/snow'
  Plug 'rhysd/vim-color-spring-night'
  Plug 'sonph/onehalf', {'rtp': 'vim/'}
  call plug#end()
