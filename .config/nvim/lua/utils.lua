local M = {}
local vim = vim

local create_map = function(mode)
	return function(lhs, rhs, config)
		vim.keymap.set(mode, lhs, rhs, config)
	end
end


M.nmap = create_map('n')
M.vmap = create_map('v')
M.imap = create_map('i')

return M
