local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

treesitter.setup {
	ensure_installed = {
		'bash',
		'json',
		'kotlin',
		'lua',
		'markdown',
		'swift'
	},
	sync_install = true,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	}
}
