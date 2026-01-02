return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			on_attach = function(bufnr)
				local vim = vim
				local map = require("utils.map")

				local gs = package.loaded.gitsigns

				map.n("[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(function()
						gs.prev_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Gitsigns: Previous hunk" })

				map.n("]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(function()
						gs.next_hunk()
					end)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Gitsigns: Next hunk" })

				map.n("<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Gitsigns: Stage hunk" })
				map.n("<leader>hu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Gitsigns: Unstage hunk" })
				map.n("<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Gitsigns: Preview hunk" })

				map.n("<leader>hb", function()
					gs.blame_line({ full = true })
				end, { buffer = bufnr, desc = "Gitsigns: Blame line" })
				map.n("<leader>tb", gs.toggle_current_line_blame, { buffer = bufnr })

				map.n("<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Gitsigns: View diff" })
				map.n("<leader>hD", function()
					gs.diffthis("~")
				end, { buffer = bufnr })
			end,
		},
	},
}
