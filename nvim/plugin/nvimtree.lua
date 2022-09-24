local status, tree = pcall(require, 'nvim-tree')
if (not status) then return end

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
