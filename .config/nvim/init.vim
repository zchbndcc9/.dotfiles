" Plugs
source $HOME/.config/nvim/plugs.vim

set completeopt=noinsert,menuone,noselect

let g:closetag_filenames= '*.html, *.xhtml, *.xml, *.js, *.jsx'

let mapleader = ';'

" COC
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>fi  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
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
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-t>f :NERDTreeFind<CR>

nmap ff  <cmd>:lua require('telescope.builtin').find_files()<CR>
nmap <C-A> <cmd>:lua require('telescope.builtin').live_grep()<CR>
nmap <C-B> <cmd>:lua require('telescope.builtin').buffers()<CR>
nmap fb :lua require('telescope.builtin').git_branches()<CR>
nmap fc :lua require('telescope.builtin').colorscheme()<CR>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprevious<CR>

nnoremap <silent> <leader>q :q<cr>
nnoremap <silent> <leader>s :w<cr>
nnoremap <silent> <leader>w :Bdelete<cr>
nnoremap <silent> vv <c-w>v
nnoremap <silent> ss <c-w>s
nnoremap <silent> yp yy p

inoremap <silent><expr> <TAB>
\ pumvisible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#manual_complete()

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

set signcolumn=number

lua << EOF
  local actions = require'telescope.actions'
  local path_to_elixirls = vim.fn.expand("~/.cache/nvim/lspconfig/elixirls/elixir-ls/release/language_server.sh")
  
  local lspconfig = require'lspconfig'

  lspconfig.tsserver.setup{}
  
  lspconfig.elixirls.setup{
    cmd = {path_to_elixirls}
  }

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
  require'gitsigns'.setup()
  require'trouble'.setup()
  require'lsp-colors'.setup()
  
  vim.cmd[[colorscheme aurora]]
EOF

