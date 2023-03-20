local M = {}
local vim = vim

local create_map = function(mode)
	return function(lhs, rhs, config)
		vim.keymap.set(mode, lhs, rhs, config)
	end
end


M.n = create_map('n')
M.v = create_map('v')
M.i = create_map('i')

return M
