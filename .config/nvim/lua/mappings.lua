local vim = vim

local map = require("utils.map")

vim.g.mapleader = " "

map.i("jj", "<Esc>")

map.n("<leader>q", [[:q<CR>]], { silent = true, desc = "Quit" })
map.n("<leader>s", [[:w<CR>]], { silent = true, desc = "Save" })

map.n("<C-n>", [[:bnext<CR>]], { desc = "Next buffer" })
map.n("<C-p>", [[:bprevious<CR>]], { desc = "Previous buffer" })

map.n("<leader>le", [[:e $MYVIMRC<CR>]], { silent = true, desc = "Open neovim config" })
map.n("<leader>lr", [[:e! %<CR>]], { silent = true, desc = "Reload file" })

-- Pane switching
map.n("wj", "<C-w>j", { silent = true, desc = "Switch buffer: Left" })
map.n("wh", "<C-w>h", { silent = true, desc = "Switch buffer: Up" })
map.n("wk", "<C-w>k", { silent = true, desc = "Switch buffer: Down" })
map.n("wl", "<C-w>l", { silent = true, desc = "Switch buffer: Right" })
map.n("ss", "<C-w>s", { silent = true, desc = "Split buffer: Horizontal" })
map.n("vv", "<C-w>v", { silent = true, desc = "Split buffer: Vertical" })

-- Pane switching out of terminal mode (e.g. Claude terminal)
map.t("<C-w>h", [[<C-\><C-n><C-w>h]], { silent = true, desc = "Terminal: switch pane left" })
map.t("<C-w>j", [[<C-\><C-n><C-w>j]], { silent = true, desc = "Terminal: switch pane down" })
map.t("<C-w>k", [[<C-\><C-n><C-w>k]], { silent = true, desc = "Terminal: switch pane up" })
map.t("<C-w>l", [[<C-\><C-n><C-w>l]], { silent = true, desc = "Terminal: switch pane right" })

vim.api.nvim_create_autocmd({ "BufEnter", "TermOpen" }, {
	pattern = "term://*",
	command = "startinsert",
})

map.n("grd", vim.lsp.buf.definition, { desc = "View definition" })
map.n("gL", vim.diagnostic.open_float, { desc = "Open float menu" })
map.n("K", vim.lsp.buf.hover, { desc = "Hover" })
map.n("[d", function()
	vim.diagnostic.jump({
		count = -1,
	})
end, { desc = "Previous diagnostic" })
map.n("[D", function()
	vim.diagnostic.jump({
		severity = vim.diagnostic.severity.ERROR,
		count = -1,
	})
end, { desc = "Previous error" })
map.n("]d", vim.diagnostic.jump, { desc = "Next diagnostic" })
map.n("]D", function()
	vim.diagnostic.jump({
		severity = vim.diagnostic.severity.ERROR,
	})
end, { desc = "Next error" })
