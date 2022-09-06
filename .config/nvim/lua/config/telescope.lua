local nmap = require 'utils'.nmap

local telescope = require 'telescope'
local telescope_actions = require 'telescope.actions'
local telescope_builtin = require 'telescope.builtin'

telescope.setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = 'smart_case',
		}
	},
	pickers = {
		colorscheme = {
			enable_preview = true
		}
	},
	defaults = {
		mappings = {
			i = {
				["<C-J>"] = telescope_actions.move_selection_next,
				["<C-K>"] = telescope_actions.move_selection_previous,
				["<C-A>"] = false,
			}
		}
	}
}
telescope.load_extension 'fzf'
telescope.load_extension 'node_modules'

nmap('ff', telescope_builtin.find_files)
nmap('<leader>ag', telescope_builtin.live_grep)
nmap('<leader>ob', telescope_builtin.buffers)
nmap('fb', telescope_builtin.git_branches)
nmap('fc', telescope_builtin.colorscheme)
