local nvim_lsp_status, lspconfig = pcall(require, 'lspconfig')
if (not nvim_lsp_status) then return end

local nvim_lsp_installer_status, nvim_lsp_installer = pcall(require, 'nvim-lsp-installer')
if (not nvim_lsp_installer_status) then return end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not cmp_nvim_lsp_status) then return end

nvim_lsp_installer.setup {
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
}

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

		local bufopts = { noremap=true, silent=true, buffer=bufnr }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

-- Lua
lspconfig.sumneko_lua.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
 		Lua = {
 			diagnostics = {
 				globals = { 'vim' }
 			},
 			workspace = {
 				library = vim.api.nvim_get_runtime_file("", true)
 			}
 		}
 	}
}

-- Markdown
lspconfig.marksman.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- SourceKit
lspconfig.sourcekit.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Bashls
lspconfig.bashls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}

