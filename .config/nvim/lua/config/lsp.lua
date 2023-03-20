local vim = vim
local telescope_builtin = require 'telescope.builtin'
local map = require 'utils.map'

local on_attach = function(client, buffer)
	map.n('<leader>gd', vim.lsp.buf.definition, { buffer = buffer })
	map.n('<leader>gt', vim.lsp.buf.type_definition, { buffer = buffer })
	map.n('<leader>gi', telescope_builtin.lsp_references, { buffer = buffer })
	map.n('gL', vim.diagnostic.open_float, { buffer = buffer })
	map.n('K', vim.lsp.buf.hover, { buffer = buffer })
	map.n('<leader>rn', vim.lsp.buf.rename, { buffer = buffer })
	map.n('<leader>ca', vim.lsp.buf.code_action, { buffer = buffer })
	map.v('<leader>ca', vim.lsp.buf.code_action, { buffer = buffer })
	map.n('[d', vim.diagnostic.goto_prev, { buffer = buffer })
	map.n('[D', function()
		vim.diagnostic.goto_prev {
			severity = vim.diagnostic.severity.ERROR
		}
	end, { buffer = buffer })
	map.n(']d', vim.diagnostic.goto_next, { buffer = buffer })
	map.n(']D', function()
		vim.diagnostic.goto_next {
			severity = vim.diagnostic.severity.ERROR
		}
	end, { buffer = buffer })
	map.n('fn', '<cmd>Telescope node_modules list<CR>', { buffer = buffer })
	map.n('<leader>fi', vim.lsp.buf.format)

	if client.server_capabilities.colorProvider then
		-- Attach document color support
		require("document-color").buf_attach(buffer, { mode = "background" })
	end
end

local servers = require 'mason-lspconfig'.get_installed_servers()
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- Loop through servers and setup lspconfig
for _, server in ipairs(servers) do
	-- Attach lua global if server is sumneko_lua
	if server == 'sumneko_lua' then
		require 'lspconfig'.sumneko_lua.setup {
			server = 'sumneko_lua',
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim' },
					},
				},
			},
		}
	end

	require 'lspconfig'[server].setup {
		server = server,
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
