local status, nvimLsp = pcall(require, 'lspconfig')
if (not status) then return end

local onAttach = function(client, bufnr)
	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function() vim.lsp.buf.formatting_seq_sync() end
		})
	end
end

-- Lua
nvimLsp.sumneko_lua.setup {
	on_attach = onAttach,
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
