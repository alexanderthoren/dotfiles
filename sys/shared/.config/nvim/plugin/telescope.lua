local status, telescope = pcall(require, 'telescope')
if (not status) then return end

telescope.setup {
	pickers = {
		find_files = {
			hidden = true
		},
		grep_string = {
			additional_args = function()
				return {"--hidden"}
			end
		},
		live_grep = {
			additional_args = function()
				return {"--hidden"}
			end
		}
	}
}

telescope.load_extension('fzf')
