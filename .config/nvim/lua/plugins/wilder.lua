local wilder = require 'wilder'

wilder.setup { modes = { ':', '/', '?' } }

wilder.set_option('pipeline', {
	wilder.branch(
		wilder.cmdline_pipeline {
			fuzzy = 2,
		},
		wilder.search_pipeline(),
		wilder.python_search_pipeline {
			pattern = wilder.python_fuzzy_pattern()
		}
	),
})

wilder.popupmenu_renderer(
	wilder.popupmenu_border_theme({
		border = 'rounded',
		highlighter = wilder.basic_highlighter(),
		left = { ' ', wilder.popupmenu_devicons() },
	})
)
wilder.set_option('renderer', wilder.popupmenu_renderer {
	highlighter = wilder.basic_highlighter(),
})
