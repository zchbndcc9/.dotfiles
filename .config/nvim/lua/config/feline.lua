
local beer_spacer = {
	provider = '',
	hl = {
		fg = 'blue',
		bg = 'bg',
	},
	left_sep = 'block',
	right_sep = 'block',
}

local vim_mode = {
	provider = 'vi_mode',
	hl = function()
		return {
			name = require 'feline.providers.vi_mode'.get_mode_highlight_name(),
			bg = require 'feline.providers.vi_mode'.get_mode_color(),
			fg = 'black',
			style = 'bold',
		}
	end,
	left_sep = {
		{
			str = 'right_filled',
			hl = function()
				return {
					name = require 'feline.providers.vi_mode'.get_mode_highlight_name(),
					bg = require 'feline.providers.vi_mode'.get_mode_color(),
					fg = 'bg',
					style = 'bold',
				}
			end,
		},
		'block'
	},
	right_sep = {
		'block',
		'right_filled',
	},
	icon = ''
}

local git = {
	provider = 'git_branch',
	enabled = function()
		return require 'feline.providers.git'.git_info_exists()
	end,
	hl = {
		fg = 'pink',
		style = 'italic',
	},
	icon = ' ',
	right_sep = {
		'block',
		{
			str = 'right',
			hl = {
				fg = 'pink',
			},
		}
	},
	left_sep = 'block',
}

local file_type = {
	provider = {
		name = 'file_type',
		opts = {
			filetype_icon = true,
			case = 'lowercase',
		},
	},
	left_sep = 'left_filled',
}

local position = {
	provider = 'position',
	left_sep = 'left_filled',
}

local feline = require 'feline'
local colors = require'tokyonight.colors'.setup()

feline.setup {
	components = {
		active = {
			{
				beer_spacer,
				vim_mode,
				git,
				{ provider = 'diagnostic_errors' },
				{ provider = 'diagnostic_warnings' },
				{ provider = 'diagnostic_info' },
			},
			{
				file_type,
				position,
			},
		},
		inactive = {
			{},
			{},
		},
	},
}

feline.use_theme(colors)
