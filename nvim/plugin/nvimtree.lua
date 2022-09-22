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
	open_on_setup = true,
	open_on_setup_file = true,
	open_on_tab = true,
	disable_netrw = true,
	hijack_netrw = true,
	sort_by = 'case_sensitive',
	remove_keymaps = {'s'},
	on_attach = 'disabled',
	view = {
		side = "left",
		width = 30,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
	},
}
