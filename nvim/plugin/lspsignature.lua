local status, lspsignature = pcall(require, 'lsp_signature')
if (not status) then return end

lspsignature.setup {
	bind = true,
	handler_opts = {
		border = "rounded"
	}
}
