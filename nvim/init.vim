" Plugs
source $HOME/.dotfiles/nvim/plugs.vim

au BufRead,BufNewFile *.sbt set filetype=scala

" Ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'javascript.jsx': ['prettier', 'eslint'],
\ }

" Airline config
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1

let g:closetag_filenames= '*.html, *.xhtml, *.xml, *.js, *.jsx'

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
set mouse=a

"folding settings
set foldmethod=indent
set nofoldenable
set foldlevel=1
