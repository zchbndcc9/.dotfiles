local vim = vim

local map = require("utils.map")

vim.g.mapleader = " "

map.i("jj", "<Esc>")

map.n("<leader>q", [[:q<CR>]], { silent = true, desc = "Quit" })
map.n("<leader>s", [[:w<CR>]], { silent = true, desc = "Save" })

map.n("<C-n>", [[:bnext<CR>]], { desc = "Next buffer" })
map.n("<C-p>", [[:bprevious<CR>]], { desc = "Previous buffer" })

map.n("<leader>le", [[:e $MYVIMRC<CR>]], { silent = true, desc = "Open neovim config" })

-- Pane switching
map.n("wj", "<C-w>j", { silent = true, desc = "Switch buffer: Left" })
map.n("wh", "<C-w>h", { silent = true, desc = "Switch buffer: Up" })
map.n("wk", "<C-w>k", { silent = true, desc = "Switch buffer: Down" })
map.n("wl", "<C-w>l", { silent = true, desc = "Switch buffer: Right" })
map.n("ss", "<C-w>s", { silent = true, desc = "Split buffer: Horizontal" })
map.n("vv", "<C-w>v", { silent = true, desc = "Split buffer: Vertical" })

map.n("<leader>gd", vim.lsp.buf.definition, { desc = "View definition" })
map.n("<leader>gt", vim.lsp.buf.type_definition, { desc = "View type definition" })
map.n("gL", vim.diagnostic.open_float, { desc = "Open float menu" })
map.n("K", vim.lsp.buf.hover, { desc = "Hover" })
map.n("<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
map.n("<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map.v("<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map.n("[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map.n("[D", function()
	vim.diagnostic.goto_prev({
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "Previous error" })
map.n("]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map.n("]D", function()
	vim.diagnostic.goto_next({
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "Next error" })
