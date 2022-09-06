local vim = vim
local telescope_builtin = require 'telescope.builtin'
local nmap = require 'utils'.nmap

local on_attach = function(client, buffer)
	nmap('gd', vim.lsp.buf.definition, { buffer = buffer })
	nmap('gD', vim.lsp.buf.type_definition, { buffer = buffer })
	nmap('gt', vim.lsp.buf.type_definition, { buffer = buffer })
	nmap('gi', telescope_builtin.lsp_references, { buffer = buffer })
	nmap('gL', vim.diagnostic.open_float, { buffer = buffer })
	nmap('K', vim.lsp.buf.hover, { buffer = buffer })
	nmap('<leader>rn', vim.lsp.buf.rename, { buffer = buffer })
	nmap('<leader>ca', vim.lsp.buf.code_action, { buffer = buffer })
	nmap('fn', '<cmd>Telescope node_modules list<CR>', { buffer = buffer })
	nmap('<leader>fi', vim.lsp.buf.format)

	if client.server_capabilities.colorProvider then
		-- Attach document colour support
		require("document-color").buf_attach(buffer, { mode = "background" })
	end
end

local servers = require 'mason-lspconfig'.get_installed_servers()
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- Loop through servers and setup lspconfig
for _, server in ipairs(servers) do
	require 'lspconfig'[server].setup {
		server = server,
		on_attach = on_attach,
		capabilities = capabilities,
	}
end
