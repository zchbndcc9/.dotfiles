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

map.n('<leader>gd', vim.lsp.buf.definition)
map.n('<leader>gt', vim.lsp.buf.type_definition)
map.n('gL', vim.diagnostic.open_float)
map.n('K', vim.lsp.buf.hover)
map.n('<leader>rn', vim.lsp.buf.rename)
map.n('<leader>ca', vim.lsp.buf.code_action)
map.v('<leader>ca', vim.lsp.buf.code_action)
map.n('[d', vim.diagnostic.goto_prev)
map.n('[D', function()
	vim.diagnostic.goto_prev {
		severity = vim.diagnostic.severity.ERROR
	}
end)
map.n(']d', vim.diagnostic.goto_next)
map.n(']D', function()
	vim.diagnostic.goto_next {
		severity = vim.diagnostic.severity.ERROR
	}
end)
map.n('<leader>fi', vim.lsp.buf.format)
