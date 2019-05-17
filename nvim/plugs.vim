call plug#begin('~/.local/share/nvim/plugged')
  " Scala
  Plug 'derekwyatt/vim-scala'
  Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
  
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
  Plug 'elixir-editors/vim-elixir'
  Plug 'mattreduce/vim-mix'
	Plug 'BjRo/vim-extest'
	Plug 'frost/vim-eh-docs'
	Plug 'slashmili/alchemist.vim'
	Plug 'jadercorrea/elixir_generator.vim'
	Plug 'mhinz/vim-mix-format'

  " Utilities
  Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
  Plug 'airblade/vim-gitgutter'
	Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
	Plug 'itchyny/lightline.vim'
	Plug 'tpope/vim-endwise'
	Plug 'majutsushi/tagbar'
	Plug 'mattn/emmet-vim'
  Plug 'scrooloose/nerdtree'
call plug#end()
