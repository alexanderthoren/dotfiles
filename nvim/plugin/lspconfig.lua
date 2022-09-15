local nvim_lsp_status, nvim_lsp = pcall(require, 'lspconfig')
if (not nvim_lsp_status) then return end

local nvim_lsp_installer_status, nvim_lsp_installer = pcall(require, 'nvim-lsp-installer')
if (not nvim_lsp_installer_status) then return end

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

-- Lua
nvim_lsp.sumneko_lua.setup {}

-- Markdown
nvim_lsp.marksman.setup {}

-- SourceKit
nvim_lsp.sourcekit.setup {}
