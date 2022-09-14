local status, nvimLsp = pcall(require, 'lspconfig')
if (not status) then return end

-- Lua
nvimLsp.sumneko_lua.setup {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the 'vim' global
				globals = { 'vim' }
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
}
