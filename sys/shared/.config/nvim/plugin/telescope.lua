local status, telescope = pcall(require, 'telescope')
if (not status) then return end

telescope.setup {
	pickers = {
		find_files = {
			file_ignore_patterns = {
				".git/"
			},
			hidden = true
		},
		grep_string = {
			file_ignore_patterns = {
				".git/"
			},
			additional_args = function()
				return {"--hidden"}
			end
		},
			file_ignore_patterns = {
				".git/"
			},
		live_grep = {
			file_ignore_patterns = {
				".git/"
			},
			additional_args = function()
				return {"--hidden"}
			end
		}
	}
}

telescope.load_extension('fzf')
