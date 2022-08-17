local utils = {}

local create_map = function(mode)
	return function(lhs, rhs, config)
		vim.keymap.set(mode, lhs, rhs, config)
	end
end

utils.nmap = create_map('n')
utils.vmap = create_map('v')
utils.imap = create_map('i')

return utils
