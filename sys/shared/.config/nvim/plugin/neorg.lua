local status, neorg = pcall(require, 'neorg')
if (not status) then return end

neorg.setup {
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {},
		["core.norg.completion"] = {
			config = {
				engine = 'nvim-cmp'
			}
		},
		["core.presenter"] = {
			config = {
				zen_mode = 'zen-mode'
			}
		}
	}
}
