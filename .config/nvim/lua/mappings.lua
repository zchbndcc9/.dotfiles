local vim = vim
local nmap = require'utils'.nmap
local imap = require'utils'.imap

vim.g.mapleader = ';'

vim.keymap.set('', '<Space>', ':')
imap('jj', '<Esc>')

require('leap').set_default_keymaps()

nmap('<leader>q', [[:q<CR>]], { silent = true })
nmap('<leader>s', [[:w<CR>]], { silent = true })
nmap('<leader>w', [[:Bdelete<CR>]], { silent = true })

nmap('<C-n>', [[:bnext<CR>]])
nmap('<C-p>', [[:bprevious<CR>]])

nmap('<leader>le', [[:e $MYVIMRC<CR>]], { silent = true })

-- Pane switching
nmap('wj', '<C-w>j', { silent = true })
nmap('wh', '<C-w>h', { silent = true })
nmap('wk', '<C-w>k', { silent = true })
nmap('wl', '<C-w>l', { silent = true })
nmap('ss', '<C-w>s', { silent = true })
nmap('vv', '<C-w>v', { silent = true })

nmap('<C-G>', [[:Git<CR>]])
