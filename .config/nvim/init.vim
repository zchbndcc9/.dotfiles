" Plugs
source $HOME/.config/nvim/plugs.vim

set completeopt=noinsert,menuone,noselect

" Language Server Stuff
let g:LanguageClient_serverCommands = {
\   'reason': ['~/.local/share/nvim/lsp/reason-language-server'],
\   'javascript': ['/usr/local/bin/javascript-typescript-stdio']
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

let g:closetag_filenames= '*.html, *.xhtml, *.xml, *.js, *.jsx'

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

nnoremap <C-G><C-G> :Git<CR> 

map <Space> :
nnoremap <C-t> :NvimTreeToggle<CR>
nnoremap <C-t>f :NvimTreeFindFile<CR>
nnoremap <C-t>r :NvimTreeRefresh<CR>
nmap ff  <cmd>:lua require('telescope.builtin').find_files()<CR>
nmap <C-A> <cmd>:lua require('telescope.builtin').live_grep()<CR>
nmap <C-B> <cmd>:lua require('telescope.builtin').buffers()<CR>
nmap fb :lua require('telescope.builtin').git_branches()<CR>
nmap fc :lua require('telescope.builtin').colorscheme()<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprevious<CR>

let mapleader = ';'
nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>s :w<cr>
nnoremap <silent> <leader>w :Bdelete<cr>
nnoremap <silent> vv <c-w>v
nnoremap <silent> ss <c-w>s
nnoremap <silent> yp yy p

"folding settings
set foldmethod=indent
set nofoldenable
set foldlevel=1

set includeexpr=substitute(v:fname,'^~','./src')

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

syntax on
let base16colorspace=256
set termguicolors

lua << EOF
  local actions = require'telescope.actions'

  require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    ignore_install = { "haskell" },
    highlight = {
      enable = true,
    },
  }
  require'lualine'.setup {
    options = {
      theme = "tokyonight",
      section_separators = ''
    },
    extensions = {'chadtree', 'fugitive'},
  }
  require'telescope'.setup {
    defaults = {
      mappings = {
        i = {
          ["<C-J>"] = actions.move_selection_next,
          ["<C-K>"] = actions.move_selection_previous,
          ["<C-A>"] = false,
        }
      }
    }
  }
  require'bufferline'.setup()
  require'colorizer'.setup()
  
  vim.cmd[[colorscheme onehalflight]]
EOF

