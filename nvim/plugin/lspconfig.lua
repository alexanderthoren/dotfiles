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

local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Lua
lspconfig.sumneko_lua.setup {
	capabilities = capabilities,
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
}

-- SourceKit
lspconfig.sourcekit.setup {
	capabilities = capabilities,
}

-- Bashls
lspconfig.bashls.setup {
	capabilities = capabilities,
}

