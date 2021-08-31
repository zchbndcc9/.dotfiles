" Plugs
source $HOME/.config/nvim/plugs.vim

autocmd BufEnter * call ncm2#enable_for_buffer()
let g:neosnippet#enable_completed_snippet = 1
set completeopt=noinsert,menuone,noselect

" Language Server Stuff
let g:LanguageClient_serverCommands = {
\   'reason': ['~/.local/share/nvim/lsp/reason-language-server'],
\}

" Ale
let g:ale_linters = {
\  'elixir': ['elixir-ls', 'dialyxir']
\ }

let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'javascript.jsx': ['prettier', 'eslint'],
\  'typescript': ['prettier', 'eslint'],
\  'typescriptreact': ['prettier', 'eslint'],
\  'python': ['flake8', 'pylint'],
\  'elixir': ['mix_format']
\ }

nmap fi :ALEFix<CR>
nmap <C-H> :ALEHover<CR>
nmap <C-[> :ALEGoToDefinition<CR>
nmap <C-]> :ALEFindReferences<CR>
nmap <C-A><C-I> :ALEImport<CR>
nmap <C-D> :ALEDetail<CR>
nmap <C-A><C-N> :ALENext<CR>
nmap <C-A><C-P> :ALEPrevious<CR>

let g:ale_elixir_elixir_ls_release = "/Users/zach/elixir-ls/rel"
let g:ale_completion_autoimport = 1

let g:coq_settings = { 'auto_start': v:true }

" Airline config
let g:airline_theme='purify'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:closetag_filenames= '*.html, *.xhtml, *.xml, *.js, *.jsx'

" Nerdtree config
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" GitGutter config
set updatetime=100 
highlight GitGutterAdd    guifg=#009900
highlight GitGutterChange guifg=#bbbb00
highlight GitGutterDelete guifg=#ff2222

" Various Config
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
set spelllang=en

" Relative Numbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Mappings
set timeoutlen=300

inoremap jj <Esc>

" Pane switching
nnoremap <silent> wj <C-w>j
nnoremap <silent> wh <C-w>h
nnoremap <silent> wk <C-w>k
nnoremap <silent> wl <C-w>l

map <Space> :
nnoremap <C-t> :CHADopen<CR>
nmap ff :Files<CR>
nmap <C-A> :Ag<CR>
nmap <C-B> :Buffers<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprevious<CR>

let mapleader = ';'
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>s :w<cr>
nnoremap <silent> <leader>w :Bdelete<cr>
nnoremap <silent> vv <c-w>v
nnoremap <silent> ss <c-w>s
nnoremap <silent> yp yy p
nnoremap <silent> yp yy p

"folding settings
set foldmethod=indent
set nofoldenable
set foldlevel=1

"Colors
if &term =~ '^screen' 
  " Page keys https://github.com/tmux/tmux/wiki/FAQ
  execute "set t_kp=\e[5;*~"
  execute "set t_kn=\e[6;*~"

  " Arrow keys http://unix.stackexchange.com/a/34723
  execute "set <xUp>=\e[1;*A"
  execute "set <xdown>=\e[1;*b"
  execute "set <xright>=\e[1;*c"
  execute "set <xleft>=\e[1;*d"
endif

filetype plugin on

" Random colorschemes
" Syntax highlighting
syntax on
let base16colorspace=256
lua << EOF
require("bufferline").setup{}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  ignore_install = { "haskell" },
  highlight = {
    enable = true,
  },
}
EOF
set termguicolors
lua require'colorizer'.setup()
colorscheme tokyonight
