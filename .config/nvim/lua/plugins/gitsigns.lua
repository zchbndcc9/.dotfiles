return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			on_attach = function(bufnr)
				local vim = vim
				local map = require("utils.map")

				local gitsigns = require("gitsigns")

				map.n("[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { expr = true, buffer = bufnr, desc = "Previous hunk" })

				map.n("]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { expr = true, buffer = bufnr, desc = "Next hunk" })

				map.n("<leader>hs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage/Unstage hunk" })
				map.n("<leader>hp", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
				map.n("<leader>hr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })

				map.n("<leader>hb", function()
					gitsigns.blame_line({ full = true })
				end, { buffer = bufnr, desc = "Blame line" })
				map.n("<leader>tb", gitsigns.toggle_current_line_blame, { buffer = bufnr })

				map.n("<leader>hd", gitsigns.diffthis, { buffer = bufnr, desc = "View diff" })
				map.n("<leader>hD", function()
					gitsigns.diffthis("~")
				end, { buffer = bufnr })
			end,
		},
	},
}
