local status, tree = pcall(require, 'nvim-tree')
if (not status) then return end

--local on_attach = function(bufnr)
--	local buffer_map = function(lhs, rhs, desc)
--		vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
--	end
--
--	local api_status, api = pcall(require, 'nvim-tree.api')
--	if (not api_status) then return end
--
--	buffer_map('', api., '')
--
--end

tree.setup {
	disable_netrw = true,
	hijack_netrw = true,
	sort_by = 'case_sensitive',
	open_on_setup = true,
	open_on_setup_file = true,
	remove_keymaps = {'s'},
	on_attach = 'disabled'
}
