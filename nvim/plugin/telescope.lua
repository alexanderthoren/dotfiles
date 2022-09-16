local status, telescope = pcall(require, 'telescope')
if (not status) then return end

telescope.setup {}

telescope.load_extension('fzf')
