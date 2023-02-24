local image_status, image = pcall(require, 'image')
if (not image_status) then return end

image.setup {
	render = {
		min_padding = 5,
		show_label = true,
		use_dither = false,
	},
	events = {
		update_on_nvim_resize = true,
	}
}
