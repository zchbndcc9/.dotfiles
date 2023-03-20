local vim = vim

local map = require'utils.map'

vim.g.mapleader = ' '

map.i('jj', '<Esc>')

map.n('<leader>q', [[:q<CR>]], { silent = true })
map.n('<leader>s', [[:w<CR>]], { silent = true })
map.n('<leader>w', [[:Bdelete<CR>]], { silent = true })

map.n('<leader>p', [[:Hexplore!<CR>]])
map.n('<leader>o', [[:Explore<CR>]])
map.n('<C-n>', [[:bnext<CR>]])
map.n('<C-p>', [[:bprevious<CR>]])

map.n('<leader>le', [[:e $MYVIMRC<CR>]], { silent = true })

-- Pane switching
map.n('wj', '<C-w>j', { silent = true })
map.n('wh', '<C-w>h', { silent = true })
map.n('wk', '<C-w>k', { silent = true })
map.n('wl', '<C-w>l', { silent = true })
map.n('ss', '<C-w>s', { silent = true })
map.n('vv', '<C-w>v', { silent = true })

map.n('<C-G><C-G>', [[:Git<CR>]])
