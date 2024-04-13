local nvim_lsp_status, lspconfig = pcall(require, 'lspconfig')
if (not nvim_lsp_status) then return end

local mason_status, mason = pcall(require, 'mason')
if (not mason_status) then return end

local mason_lsp_status, mason_lsp = pcall(require, 'mason-lspconfig')
if (not mason_lsp_status) then return end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if (not cmp_nvim_lsp_status) then return end

mason.setup {
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
}

mason_lsp.setup {
	automatic_installation = false,
	ensure_installed = {
		'lua_ls',
		'bashls'
	}
}

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
	  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--		local bufopts = { noremap=true, silent=true, buffer=bufnr }
--		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
end

-- Lua
lspconfig.lua_ls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
 		Lua = {
 			diagnostics = {
 				globals = { 'vim' }
 			},
 			workspace = {
 				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
 			}
 		}
 	}
}

-- Shell
lspconfig.bashls.setup {
	filetypes = { 'sh', 'zsh' },
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Swift
lspconfig.sourcekit.setup {
	capabilities = capabilities,
	on_attach = on_attach,
}
-- Unity
local pid = vim.fn.getpid()
local omnisharp_bin = '/home/alexanderthoren/.local/share/nvim/mason/packages/omnisharp-mono/run'
lspconfig.omnisharp_mono.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		omnisharp_bin,
		'--languageserver',
		"--hostPID",
		tostring(pid)
	},
	 enable_editorconfig_support = true,
	 enable_ms_build_load_projects_on_demand = false,
	 enable_roslyn_analyzers = false,
	 organize_imports_on_format = false,
	 enable_import_completion = false,
	 sdk_include_prereleases = true,
	 analyze_open_documents_only = false,
}

-- Gdscript
lspconfig.gdscript.setup {}
