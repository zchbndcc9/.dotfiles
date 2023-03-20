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
		maps = {
			i = {
				["<C-J>"] = telescope_actions.move_selection_next,
				["<C-K>"] = telescope_actions.move_selection_previous,
				["<C-A>"] = false,
			}
		}
	}
}
telescope.load_extension 'fzf'
