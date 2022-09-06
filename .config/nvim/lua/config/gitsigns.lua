local vim = vim
local nmap = require 'utils'.nmap

require 'gitsigns'.setup {
	current_line_blame = true,
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		nmap('[c', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(function() gs.prev_hunk() end)
			return '<Ignore>'
		end, { expr = true, buffer = bufnr })

		nmap(']c', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(function() gs.next_hunk() end)
			return '<Ignore>'
		end, { expr = true, buffer = bufnr })

		nmap('<leader>hs', gs.stage_hunk, { buffer = bufnr })
		nmap('<leader>hu', gs.undo_stage_hunk, { buffer = bufnr })
		nmap('<leader>hp', gs.preview_hunk, { buffer = bufnr })

		nmap('<leader>hb', function() gs.blame_line { full = true } end, { buffer = bufnr })
		nmap('<leader>tb', gs.toggle_current_line_blame, { buffer = bufnr })

		nmap('<leader>hd', gs.diffthis, { buffer = bufnr })
		nmap('<leader>hD', function() gs.diffthis('~') end, { buffer = bufnr })
	end
}
