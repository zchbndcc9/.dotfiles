call plug#begin('~/.local/share/nvim/plugged')
  " Scala
  Plug 'derekwyatt/vim-scala'
  
  " C++
  Plug 'octol/vim-cpp-enhanced-highlight'

  " HTML
  Plug 'alvan/vim-closetag'
  
  " Javascript/React
  Plug 'mxw/vim-jsx'
  Plug 'pangloss/vim-Javascript'

  " Go
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

  " Elixir / Phoenix
  Plug 'slashmili/alchemist.vim'
  Plug 'elixir-editors/vim-elixir'
  Plug 'frost/vim-eh-docs'
  Plug 'jadercorrea/elixir_generator.vim'
  Plug 'mhinz/vim-mix-format'

  " YAML
  Plug 'stephpy/vim-yaml'
  
  " Utilities
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  Plug 'w0rp/ale'
  Plug 'carlitux/deoplete-ternjs', { 'do': 'yarn add -g tern' }
  Plug 'airblade/vim-gitgutter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-endwise'
  Plug 'majutsushi/tagbar'
  Plug 'mattn/emmet-vim'
  Plug 'scrooloose/nerdtree'
call plug#end()
