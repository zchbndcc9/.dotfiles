require 'null-ls'.setup {
	sources = {
		require 'null-ls'.builtins.code_actions.eslint,
		require 'null-ls'.builtins.code_actions.gitsigns,
		require 'null-ls'.builtins.code_actions.refactoring,

		require 'null-ls'.builtins.formatting.prettier,
		require 'null-ls'.builtins.formatting.rustywind,

		require 'null-ls'.builtins.diagnostics.eslint,
	},
}
