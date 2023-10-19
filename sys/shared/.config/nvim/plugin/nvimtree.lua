local status, tree = pcall(require, 'nvim-tree')
if (not status) then return end

local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

local function my_on_attach(bufnr)
	local api = require('nvim-tree.api')
	api.config.mappings.default_on_attach(bufnr)
	vim.keymap.del('n', 's', { buffer = bufnr })
end

tree.setup {
	disable_netrw = true,
	hijack_netrw = true,
	sort_by = 'case_sensitive',
	on_attach = my_on_attach,
	view = {
		side = "left",
		width = 30,
	},
	update_focused_file = {
		enable = true,
		update_root = false,
	},
}
