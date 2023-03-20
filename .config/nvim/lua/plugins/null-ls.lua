require 'null-ls'.setup {
	sources = {
		require 'null-ls'.builtins.code_actions.eslint_d,
		require 'null-ls'.builtins.code_actions.gitsigns,

		require 'null-ls'.builtins.formatting.prettier,

		require 'null-ls'.builtins.diagnostics.tsc,
		require 'null-ls'.builtins.diagnostics.eslint_d,
	},
}
