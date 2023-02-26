local status, tree = pcall(require, 'nvim-tree')
if (not status) then return end

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

tree.setup {
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
