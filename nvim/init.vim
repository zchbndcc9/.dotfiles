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

let g:lightline = { 'colorscheme': 'jellybeans' }

let g:closetag_filenames= '*.html, *.xhtml, *.xml, *.js, *.jsx'


" Coc
au BufRead,BufNewFile *.sbt set filetype=scala

" GitGutter config
set updatetime=100 
highlight GitGutterAdd    guifg=#009900
highlight GitGutterChange guifg=#bbbb00
highlight GitGutterDelete guifg=#ff2222

" NERDTree config
augroup nerdTree
  au!
  au StdinReadPre * let s:std_in=1
  au VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  au bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END 

set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB
set expandtab
set number
set enc=utf-8
set fileencoding=utf-8
