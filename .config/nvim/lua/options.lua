local vim = vim
local opt = vim.opt

opt.signcolumn = 'number'
opt.shiftwidth = 2
opt.tabstop = 2
opt.number = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.mouse = 'a'
opt.spelllang = 'en'
opt.termguicolors = true

opt.timeoutlen = 300

opt.completeopt = 'menuone,noinsert,noselect'

vim.cmd [[colorscheme tokyonight]]
